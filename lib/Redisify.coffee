module.exports = (options)->
  Redis = options.redis 
  model = options.model
  name  = model.className
  name_reg = new RegExp("#{name}_")
  console.log("redisifying #{name}")

  model.include
    redisUpdate:->
      console.log("redis update #{name}_#{@id} ", JSON.stringify(@toJSON()))
      Redis.set "#{name}_#{@id}", JSON.stringify(@toJSON())

    redisSave:->
      console.log("redis save")
      self = @
      Redis.get "#{name}_#{@id}" , (err,result) ->
        if result 
          self.redisUpdate() 
        else 
          self.redisCreate()
    
    redisCreate:->
      console.log("redis create")
      self = @
      Redis.incr "id_counter_#{name}", (err,results)->
        self.id = results
        self.redisUpdate()

    redisDelete:->
      console.log("redis delete")

  model.extend
    redisFind : (id,callback)->
      Redis.get "#{name}_#{id}", (err,result)->
        s = new model(JSON.parse(result))
        callback(s)

    redisAll : (callback)->
      Redis.keys "#{name}_*", (err, results)->
        ids= (result.replace(name_reg,"") for result in results)
        callback(ids)
    
    redisCount: (callback)->
      callback(10)