Received: from mail-qt1-f176.google.com (mail-qt1-f176.google.com [209.85.160.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B68437267E
	for <linux-kselftest@vger.kernel.org>; Tue,  1 Sep 2026 21:35:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788298519; cv=none; b=p9vUgfCpYD6LRWdcYRYjgIXW6i2GQOnFxJ29Uk2howTJ43uz4rIgX0ZxUcILnB4TK9jdfmUegS2/7v3wmlwjVPTNS8n5NhGr5mKDYgBOc9fxFT/9bR803sjETBo3WU4yi+0+8RPToBfBcJFH+13LMt1zX536N+zyQLwA9CzZOVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788298519; c=relaxed/simple;
	bh=mf9p58cMBVYfVcWyFSmmlKsO3JLi/Qf2gNci71PGb/Q=;
	h=Date:Message-ID:MIME-Version:Content-Type:From:To:Cc:Subject:
	 References:In-Reply-To; b=cn9dxXrcuzYx1ZWWWEBYGEId09bO0zIZVjzsOmm5bxHXgTKYH5Lbfch6xK3+D7zPtf8ngT/Ui9446Um2aruu3GMHzjHs5fp8lawmSgsCcqGnzCDj4hmEaY+cCLls8DqQ359lDm36uwvJcHqOlbRSeKwOXzTyjSTTP7JOYy6m2Ek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com; spf=pass smtp.mailfrom=paul-moore.com; dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b=aGexhyFK; arc=none smtp.client-ip=209.85.160.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=paul-moore.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=paul-moore.com header.i=@paul-moore.com header.b="aGexhyFK"
Received: by mail-qt1-f176.google.com with SMTP id d75a77b69052e-5301db51586so3474991cf.1
        for <linux-kselftest@vger.kernel.org>; Tue, 01 Sep 2026 14:35:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=paul-moore.com; s=google; t=1788298516; x=1788903316; darn=vger.kernel.org;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :content-type:mime-version:message-id:date:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d8P1T9k9Q5xaHviJua4Ft5GkjAABFjDN/bQJ+wSyg+M=;
        b=aGexhyFKgYHSASXCITREmV2dR2lRbRFa70mo/EeN2/uLg7RFlwTtV6aFA6UwRmVZEj
         xultuzQBlVlMsih8jFMB99uEyiRyz+aL5agGDkjsqJm86LFpOCGR/Ki6h/pv8u4YWfaj
         CbwRuNXDZVM+qjfgMuG2fNRGVkH97tEy7I+Y+544MV2Fhg5mMAFjW6mtvwQ9lV6Pv/Lb
         9dYiRjM0P9tSvGPrnd11oD7VoFLJOqvioT8BGZDHHljgrXBzWqs8FDDjJItx1UMYEGYM
         CJUCwhWI8CKe0DP9kb3smfepNpr3wKbJ5V4oY0V/sulKPPuTNLtu0/NS9vItAv9RZxQm
         U5KQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788298516; x=1788903316;
        h=in-reply-to:references:subject:cc:to:from:content-transfer-encoding
         :content-type:mime-version:message-id:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d8P1T9k9Q5xaHviJua4Ft5GkjAABFjDN/bQJ+wSyg+M=;
        b=q2e0SH1T7B+UGTEamONs4a2m2/TZpLoDnHF2QIIQzPi29ZGv9g8YpvOSwmVTUQhVHZ
         /kag2C3VXjmIkqAs59xfdh4GYh33dxAtrCVtTauYxyipb8oTn/41RAlQt2GJT426FH9V
         sbN9315QvU53UTGcyXNuNcQMvGQrm4XcCDfOx3zqKNUkj89Dti5VeOOlMApFPniAbXdM
         ugxUyEoYoiE93PmwVQqQEWIsXjwHqBfIaWEcT7O4gDbkroQuWXZiK8lBY6QVYMhOOAtE
         cc5hUIaosDQ4AhNT4UhDqpFVM7TgHwrcgEIDmrXGF18Mc5CwRo33r49jESL2z2VWYpnB
         DK5A==
X-Forwarded-Encrypted: i=1; AHgh+RqgzqcxVb999LKtsmTCigeyqXvjhm1ZamqHuvQ0VHYvV3/pdx79TQR4SKtLVrbPO+VS2Eh4a/Ic8NQIGG/eylo=@vger.kernel.org
X-Gm-Message-State: AFuF++mUJzzSlVp9l41WzJTKoOu57quRFOnVFawKUBqAMTCjkv6AVvuL
	fIbv03G3MkY/Teqs9Vc9mOaZkJWUhJBodW/RcsbHXgfb2xbbPFDMhYl+4B3lmVKvFQ==
X-Gm-Gg: AR+sD10lXYk4MR1AQNxKrgzXeOG1BH+9BPiaCaZTfYS9cSBn3lhjly2BLpvuTz21/rs
	GxaFBRX1+8Hg79ZJfjdF+aBoZvnlcsZxRN9J0tjNZkJTlNyYt23wEgwMwyyhp1vWFD+4O3Tkcc1
	sSRavsnhkhJKMarf+2w4xBrW9T3Fc9ZuAxtryAlKLMsYcz5yAPnYizGJktlSL0HxKqcBKBKc71P
	1sGErDSwIxgEtmT/L4FDawSc6qqHIK0/YI3mobUb3YoKZS8GDS9sMdiaVpMDnoVuF5+TDfbe23V
	WPT6Esof26Aa/YB9i11PgNJpAV22mDGDXL7/IFnCYlwE0mPGZOybV24aTtstEOnw3OJkl+BEUod
	R31kFKkDGQy85bx16suPdWxXAnLZQRxUkxXyjtiJbdRlzRGM/Uo+1Cmc8NisCJtRiwR2gDtiPSh
	WgwYI7FQdeA0W18VQP9VT2OLZYWX59ncqKZU3xeusU+WXU5fE53e6pg3lAoZHs6heat0I9DcYlJ
	8ucMKbHEYwjvY3NbGuLZu9mWPbdTIW/DQ==
X-Received: by 2002:a05:622a:5144:b0:52f:4cd:13f6 with SMTP id d75a77b69052e-52fb93d50dcmr493029701cf.12.1788298516423;
        Tue, 01 Sep 2026 14:35:16 -0700 (PDT)
Received: from localhost (pool-71-126-255-178.bstnma.fios.verizon.net. [71.126.255.178])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-530331dc460sm5476011cf.18.2026.09.01.14.35.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 14:35:15 -0700 (PDT)
Date: Tue, 01 Sep 2026 17:35:14 -0400
Message-ID: <1e277c072e35ee68419976510ed4cc7d@paul-moore.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0 
Content-Type: text/plain; charset=UTF-8 
Content-Transfer-Encoding: 8bit 
X-Mailer: pstg-pwork:20260901_1121/pstg-lib:20260901_1604/pstg-pwork:20260901_1121
From: Paul Moore <paul@paul-moore.com>
To: Stanislav Kinsburskii <skinsburskii@gmail.com>, Shuah Khan <shuah@kernel.org>, Eric Paris <eparis@redhat.com>, Al Viro <viro@zeniv.linux.org.uk>, Amy Griffis <amy.griffis@hp.com>
Cc: Stanislav Kinsburskii <skinsburskii@gmail.com>, Frank Hofmann <hofmann@deshaw.com>, Noah Orlando <orlandon@deshaw.com>, linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, audit@vger.kernel.org
Subject: Re: [PATCH 2/3] audit: Fix filter rule accounting after automatic  removal
References: <20260806-audit-v1-2-ddd0d94ff0b6@gmail.com>
In-Reply-To: <20260806-audit-v1-2-ddd0d94ff0b6@gmail.com>

On Aug  6, 2026 Stanislav Kinsburskii <skinsburskii@gmail.com> wrote:
> 
> The audit_n_rules and audit_signals counters are incremented when filter
> rules are installed and decremented by the explicit rule deletion path.
> Rules can also disappear when a watch or tree is removed, or when an LSM
> rule cannot be reconstructed, but those paths do not update the counters.
> 
> As a result, audit_n_rules can remain nonzero after the last applicable
> rule has gone away, causing subsequent syscalls to allocate non-dummy
> audit contexts unnecessarily. A stale audit_signals value similarly
> causes unnecessary signal auditing work.
> 
> This can be reproduced for an inode watch with:
> 
>   mkdir /tmp/audit-n-rules-bench
>   touch /tmp/audit-n-rules-bench/watched
>   auditctl -w /tmp/audit-n-rules-bench/watched -p r \
>            -k audit_n_rules_bench
>   rm /tmp/audit-n-rules-bench/watched
>   rmdir /tmp/audit-n-rules-bench
> 
> The rm updates the watch after its inode disappears, and the rmdir causes
> audit_remove_parent_watches() to remove the rule. For an audit tree, the
> kill_rules() path can be reproduced with:
> 
>   mkdir /tmp/audit-kill-rules
>   auditctl -a always,exit -F arch=b64 \
>            -F dir=/tmp/audit-kill-rules -F perm=r \
>            -k audit_kill_rules_test
>   rmdir /tmp/audit-kill-rules
> 
> In both cases, auditctl -l reports no rules after the directory is
> removed. Run the following before installing the rule and again after it
> has disappeared:
> 
>   audit_bench --iterations 10000000 --repetitions 10
> 
> For the inode watch, the same VM produced:
> 
>   no rules:
>     median=38 mean=39 stddev=4 (10%) range=38..53 ns/op
>   automatically removed, before this fix:
>     median=55 mean=56 stddev=3 (5%) range=55..65 ns/op
>   automatically removed, with this fix:
>     median=38 mean=39 stddev=4 (10%) range=38..52 ns/op
> 
> For the audit tree, it produced:
> 
>   no rules:
>     median=38 mean=39 stddev=4 (9%) range=38..52 ns/op
>   automatically removed, before this fix:
>     median=59 mean=60 stddev=2 (3%) range=59..67 ns/op
>   automatically removed, with this fix:
>     median=38 mean=39 stddev=4 (9%) range=38..52 ns/op
> 
> Reboot between the unpatched and patched tests because an already stale
> counter cannot be repaired by deleting rules which are no longer present.
> 
> Factor the existing counter updates into common rule insertion and removal
> helpers and call the removal helper from every automatic removal path. All
> of these updates remain serialized by audit_filter_mutex.
> 
> Fixes: 471a5c7c8391 ("[PATCH] introduce audit rules counter")
> Fixes: e54dc2431d74 ("[PATCH] audit signal recipients")
> Signed-off-by: Stanislav Kinsburskii <skinsburskii@gmail.com>
> ---
>  kernel/audit.h       |  5 +++
>  kernel/audit_tree.c  |  1 +
>  kernel/audit_watch.c |  2 ++
>  kernel/auditfilter.c | 86 +++++++++++++++++++++++++---------------------------
>  4 files changed, 50 insertions(+), 44 deletions(-)

This looks good to me.  I'm going to merge this into audit/dev, but I'm
going to drop the "audit_bench" references from the commit description as
I don't think we want that tool in the kernel sources right now.

Thanks Stanislav, both for finding the bug and providing a clean, elegant
fix.

--
paul-moore.com
