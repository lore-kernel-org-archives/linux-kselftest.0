From: jgkamat at fb.com (jgkamat at fb.com)
Date: Fri, 7 Sep 2018 09:49:22 -0700
Subject: kselftests for memory.oom.group
In-Reply-To: <20180905010827.27743-1-jgkamat@fb.com>
References: <20180905010827.27743-1-jgkamat@fb.com>
Message-ID: <20180907164924.13789-1-jgkamat@fb.com>

Here is an amended patch which fixes those issues.

Please let me know if you see anything else that could be improved.

Changes since the last patchset:

- Use if statement to check for empty string in cgroup_util.c
- Cleanup and return properly when failing to kill process
  in test_memcg_oom_group_score_events

Thanks,
-Jay
