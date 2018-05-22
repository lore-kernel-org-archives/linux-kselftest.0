From: shuah@kernel.org (Shuah Khan)
Date: Tue, 22 May 2018 09:44:42 -0600
Subject: [PATCH] tc-testing: fix ip address in u32 test
In-Reply-To: <1526661066-11138-1-git-send-email-vladbu@mellanox.com>
References: <1526661066-11138-1-git-send-email-vladbu@mellanox.com>
Message-ID: <a4185e7e-83d1-aa22-b4c7-831d264b3b96@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180522154442.7368oUStYTfcrvsEd_ChN1MYo8m_HVRAc5uTUrcW5Dc@z>

On 05/18/2018 10:31 AM, Vlad Buslov wrote:
> Fix expected ip address to actually match configured ip address.
> Fix test to expect single matched filter.
> 
> Signed-off-by: Vlad Buslov <vladbu at mellanox.com>

I can get this into 4.18-rc1 unless there is a reason for this to go
through net tree.

thanks,
-- Shuah
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
