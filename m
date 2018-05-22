From: shuah@kernel.org (Shuah Khan)
Date: Tue, 22 May 2018 09:35:35 -0600
Subject: [PATCH] kselftest/cgroup: fix variable dereferenced before check
 warning
In-Reply-To: <20180522101031.8451-1-guro@fb.com>
References: <20180522101031.8451-1-guro@fb.com>
Message-ID: <351128a3-5bba-8cd2-6d8a-fcaf9c33e2f3@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20180522153535.-mg1qVL8_U6bDYwiWQ1z4vgduPQQpdt66WdSS7fIfQI@z>

On 05/22/2018 04:10 AM, Roman Gushchin wrote:
> cg_name(const char *root, const char *name) is always called with
> non-empty root and name arguments, so there is no sense in checking
> it in the function body (after using in strlen()).
> 
> Signed-off-by: Roman Gushchin <guro at fb.com>
> Reported-by: Dan Carpenter <dan.carpenter at oracle.com>
> Cc: linux-kselftest at vger.kernel.org


Thanks. I will queue this up for 4.18-rc1

-- Shuah

--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
