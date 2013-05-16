module Jiraa
  module Formatters
    class Issue
      def initialize(issue, opts)
        @issue = issue
        @options = opts
      end

      def format
        color = issue_color(@issue.issuetype)
        puts "#{@issue.key}\t#{@issue.summary} [#{@issue.status.name.upcase}] (#{@issue.assignee})".colorize(color)
        if @options[:subtasks]
          puts
          puts "SUBTASKS"
          puts
          @issue.subtasks.each do |subtask|
            puts "    #{subtask.key}\t#{subtask.summary} [#{subtask.status.name.upcase}]"
          end
          puts
        end
        if @options[:description]
          puts
          puts "DESCRIPTION"
          puts
          puts "    #{@issue.description}".gsub("\n", "\n    ") if @options[:description]
        end
        if @options[:comments]
          puts
          puts "COMMENTS"
          puts
          @issue.comments.each do |comment|
            puts "    #{comment.author}: #{comment.created.strftime("%e-%b-%Y (%H:%M)")}"
            puts "    #{comment.body}".gsub("\n", "\n    ")
            puts
          end
        end
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