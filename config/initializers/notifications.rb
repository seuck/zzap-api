ActiveSupport::Notifications.subscribe "process_action.action_controller" do |name, start, finish, id, payload|
  # Catch notification to log execution time
  Callslog.create(
    :url => payload[:path],
    :method => payload[:method],
    :response_code => payload[:status],
    :page_duration => (finish - start) * 1000,
    :view_duration => payload[:view_runtime],
    :db_duration => payload[:db_runtime],
    :date => start
  )
end