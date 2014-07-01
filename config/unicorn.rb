# -*- coding: utf-8 -*-

# Unicornのプロセスがリッスンするアドレスとポートを指定
listen "127.0.0.1:3000"

#pid file
pid "tmp/pids/unicorn.pid"

# ワーカの数を指定
worker_processes 2

# リクエストのタイムアウト秒を指定
timeout 15

# ダウンタイムをなくすため、アプリをプレロード
preload_app true

# Unicornのログ出力先を指定
ROOT = File.dirname(File.dirname(__FILE__))
stdout_path = "#{ROOT}/log/unicorn-stdout.log"
stderr_path = "#{ROOT}/log/unicorn-stderr.log"

# before_fork, after_forkではUnicornのプロセスがフォークする前後の挙動を指定できる
# 以下のおまじないの詳細はドキュメント参照
before_fork do |server, worker|
	defined?(ActiveRecord::Base) and ActiveRecord::Base.connection.disconnect!

	old_pid = "#{server.config[:pid]}.oldbin"
	unless old_pid == server.pid
		begin
			Process.kill :QUIT, File.read(old_pid).to_i
		rescue Errno::ENOENT, Errno::ESRCH
		end
	end
end

after_fork do |server, worker|
	defined?(ActiveRecord::Base) and ActiveRecord::Base.establish_connection
end


