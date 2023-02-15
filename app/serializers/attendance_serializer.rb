class AttendanceSerializer
    def self.report(student_report, attendance_start_time)
        {
            total_replies: student_report.count,
            attendance_start_time: attendance_start_time,
            data: student_report.map do |student_info|
                {
                    first_name: student_info.first_name,
                    last_name: student_info.last_name,
                    full_name: student_info.full_name,
                    email: student_info.email,
                    slack_id: student_info.slack_id,
                    status: student_info.status,
                    reply_timestamp: student_info.timestamp
                }
            end 
        }
    end 

    def self.simple_report(student_report, attendance_start_time)
        {
            total_replies: student_report.count,
            attendance_start_time: attendance_start_time,
            data: student_report.map do |student_info|
                {
                    slack_id: student_info.slack_id,
                    status: student_info.status,
                    reply_timestamp: student_info.timestamp
                }
            end 
        }
    end 
end 