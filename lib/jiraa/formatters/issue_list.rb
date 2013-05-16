module Jiraa
  module Formatters
    class IssueList
      def initialize(issues)
        @issues = issues
      end

      def format
        @issues.each do |issue|
          color = issue_color(issue.issuetype)
          puts "#{issue.key}\t#{issue.summary} [#{issue.status.name.upcase}] (#{issue.assignee})".colorize(color)
        end
        puts "No issues found" if @issues.empty?
      end

      def issue_color(type)
        color = case type.name
        when "Bug"
          :red
        when "Task"
          :blue
        when "Story"
          :green
        end
        color
      end

    end
  end
end