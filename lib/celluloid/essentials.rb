module Celluloid::Internals; end

require 'celluloid/internals/call_chain'
require 'celluloid/internals/cpu_counter'
require 'celluloid/internals/links'
require 'celluloid/internals/logger'
require 'celluloid/internals/method'
require 'celluloid/internals/properties'
require 'celluloid/internals/handlers'
require 'celluloid/internals/receivers'
require 'celluloid/internals/registry'
require 'celluloid/internals/responses'
require 'celluloid/internals/signals'
require 'celluloid/internals/task_set'
require 'celluloid/internals/thread_handle'
require 'celluloid/internals/uuid'

require 'celluloid/internals/stack'

require 'celluloid/notifications'
require 'celluloid/logging'

if $CELLULOID_DEPRECATE
  puts "@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@}"
  Celluloid::Registry = Celluloid::Internals::Registry
  Celluloid::Logger = Celluloid::Internals::Logger
end

require 'celluloid/supervision'

# TODO: Remove unneeded gem requirements once the gems are well known.
require 'celluloid/pool'
require 'celluloid/fsm'