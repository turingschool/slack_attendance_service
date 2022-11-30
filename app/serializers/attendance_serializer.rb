class AttendanceSerializer
    def self.report(student_report)
        {
            total_replies: student_report.count,
            data: student_report.map do |student_info|
                {
                    first_name: student_info.first_name,
                    last_name: student_info.last_name,
                    full_name: student_info.full_name,
                    reply_timestamp: student_info.timestamp,
                    status: student_info.status
                }
            end 
        }
    end 
end 