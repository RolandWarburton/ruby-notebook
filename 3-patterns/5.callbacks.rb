# with lambda
def do_work_lambda(job, cb)
  puts "doing #{job}"
  cb.call("done")
end

def main_lambda
  do_work_lambda("work", ->(result) {puts "the lambda is #{result}"})
end
main_lambda()

# or with procs
def do_work_proc(job)
  puts "doing #{job}"
  yield "done"
end

def main_proc
  job = "chores"
  do_work_proc(job) {|result| puts "the proc is #{result}"}
end
main_proc()
