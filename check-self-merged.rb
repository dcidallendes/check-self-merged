require 'gitlab'

def is_self_merged_merge_request(project_id, merge_request_id)
    merge_request = Gitlab.merge_request(project_id, merge_request_id)
    if merge_request.author != nil and merge_request.author.id == merge_request.merged_by.id
        return true
    else 
        return false
    end
end

def is_self_merged(project_id, commit_id)
    current_commit = Gitlab.commit(project_id, commit_id)
    if current_commit == nil
        raise 'Unable to find commit'
    end
    if current_commit.parent_ids.empty?
        return false
    end
    current_commit.parent_ids.each do |parent_id|
        Gitlab.commit_merge_requests(project_id, parent_id).each do |merge_request|
            if is_self_merged_merge_request(project_id, merge_request.iid)
                return true
            end
        end
    end
    return false
end

if ARGV.length != 2
    puts "Usage: #{$0} <project_id> <commit_id>"
    exit
else 
    exit(!is_self_merged(ARGV[0].to_i, ARGV[1].to_s))
end
