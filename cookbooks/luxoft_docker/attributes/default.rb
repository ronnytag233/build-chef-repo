# install recipe attributes

default['docker']['registry-mirror'] = 'http://192.168.80.3:5000'

# registry recipe attributes

default['luxoft_docker']['registry']['port'] = %w(5000:5000)
default['luxoft_docker']['registry']['env'] = %w(STANDALONE=false) # Set to false to use as mirror
default['luxoft_docker']['registry']['tag'] = '2.4.1'