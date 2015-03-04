Then(/^the employee reports dashboard shows approval date$/) do
  page = UI::Pages::Dashboard.new
  page.displayed?

  approval_date = @report.approved_at.to_date.to_s(:short).strip

  expect(page.employees_initial_approval.first.text).to eql(approval_date)
end
