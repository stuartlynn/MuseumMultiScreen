module.exports = (options)->
  Redis = options.redis 
  model = options.model
  name  = model.className
  name_reg = new RegExp("#{name}_")
  console.log("redisifying #{name}")

  model.include
    redisUpdate:->
      Redis.set "#{name}_#{@id}", JSON.stringify(@toJSON())

    redisSave:->
      self = @
      Redis.get "#{name}_#{@id}" , (err,result) ->
        if result 
          self.redisUpdate() 
        else 
          self.redisCreate()
    
    redisCreate:->
      self = @
      Redis.incr "id_counter_#{name}", (err,results)->
        self.id = results
        self.redisUpdate()

    redisDelete:->
      Redis.del "#{name}_#{@id}"

  model.extend
    redisFind : (id,callback)->
      Redis.get "#{name}_#{id}", (err,result)->
        s = new model(JSON.parse(result))
        callback(s)

    redisAll : (callback)->
      self = @
      Redis.keys "#{name}_*", (err, results)->
        ids = (result.replace(name_reg,"") for result in results)
        records=[]
        for id in ids 
          self.redisFind id, (result)->
            records.push result
            callback(records) if records.length == ids.length

    redisCount: (callback)->
      callback(10)