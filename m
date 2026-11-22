Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.210.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795364941;
	b=OH0iL+iEb8iFkJgXPoEVTlbarjRTrc1s6LIo6d5p0wPEVyr4IKtpSs6qaWyU9wZ8CSFb
	 EJvsrj/FHj7yu0VtlQmeHOgYeq4acH5YWWywUW3WDa5/xCwd/0Ec/OMQiFAirlBT4ozpe
	 gJ9NGdZW8XbX58PfdzU5SoV1zN3/NjmcM5tWXY6u2WYhCed5TqULQfPfHZtQ3JIi1KUpN
	 P+aXAFHR75E8dAXiGAitCz0tT9yjP3hH64Tz/9sOpkkh2dhM5a6WvLGV0gcUEas02IEPb
	 aeV4b76FaN1giFk+cEErTv65D3WXiri8TbjHmmupEPiq+eZHZpZ89N2NDpgKe2TIzgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795364941;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=u54RhPh31KUc6Mfc10ElYw3foIWIoI4CAHG9i2sGAtg=;
	b=UvtmklTYmgL+DfUhEotcRa2Wme6pwepSyTVIdjQDbp+MUOO6Tn5OhrVPHNal5YcxJFVs
	 PiVHNghy2asy06HTsuBLYqdPh9gA867IqPUppss59TfRWs256XiJs3QQbqWURtvyivBTx
	 NIR13WmUPlbZYhZIqs/SAZwqba6C2ByTMj3BknPQjARY153dMJD58BwqJa70fRLKNfkgz
	 lRD5ERWK6yxEr590tjpk4smmgoOXpbjXb7gQ3a+tY8fzObsXEjRwAeYRyBcssKljwBJkm
	 INXzGBJVTHBE6/wnxbbMnY4M92kRvV8K5IRdzhLY/xXtgu69vn6rwU5GRLBKQ2q4xEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=quD4BYCc;
	arc=none smtp.remote-ip=209.85.210.173
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA8B9606A332
	for <linux-kselftest@vger.kernel.org>; Sun, 22 Nov 2026 16:29:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DA8B9606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=quD4BYCc
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-8a05b210703so1106591b3a.0
        for <linux-kselftest@vger.kernel.org>; Sun, 22 Nov 2026 08:29:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795364940; x=1795969740; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u54RhPh31KUc6Mfc10ElYw3foIWIoI4CAHG9i2sGAtg=;
        b=quD4BYCczIn20H71M1ek8V1tvx7D334/7+k7AnuKagUB4BMWfGzVI4e9xcWDx/egRk
         z5YyaiFK86ipmH7iK6YAxXA7D98G6nPJtabW3lSn1n29sMuc6fqvs/4VOWLICVYP+mmm
         F3QJz3JltyXBiH6CYg9YDbZtwt1v4sLkiAGg+XQkxFGXAKLrgifNDarBAgnUaNXxwqKY
         Y8BqBRsa9bhaJazr/2vaRBPJTNKK7Bz6lkWatYnFyGJ0TiJlGs+I38/bDBLlBFjxO426
         QUQ71JkEHoRj9N7DQWhzji45B9ZS4br/cjc/GkyaEA7Cb8TTKJERhK3agK/lTbZt7kLQ
         wqOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795364940; x=1795969740;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=u54RhPh31KUc6Mfc10ElYw3foIWIoI4CAHG9i2sGAtg=;
        b=T0Nd9HFTQQscGuO0vGzZwIPeOtvIDV10q5oNNzj+kqsQSuFGLCsZEfVQ6PZDtvbIil
         F86nd6mu9Kx6rY/6uSHqUAEuVBN31nIG4vz9vPPQz20zLatwO4rzbK4FxrAgT9xG3VQo
         aCveq90dwUOykB6PMhEdmmd7rS8EXwrUj2hvSrjgx6g5/5gRRn7jLzzbXauk3zyCInqS
         MIxSs/7DFsIgzSm/TmAXwHVocZDKoqDLWows11fDkvA8F0qyMTldwNV/Mpiret2ZAzLJ
         NxVV9IVPAbfx+bErZZ+LSTZ3tlSjkD4Ums5v/YQtzRLtbShFgrR9ssG/ekwTOAFKO+Ga
         p/aA==
X-Forwarded-Encrypted: i=1; AL+hErEdjUZ/Z547oveb4Hb+mJuqQkE1tjMx8jfrSA1cEsHgJYvatfAwOrxpx9eLf4oFYYWUI3J9aMg6Fcpda6T0ltI=@vger.kernel.org
X-Gm-Message-State: APuU4Z/2giRooZuCzTDSokh20QpBD28k9ewz+JZueuXMOGC33o7mrm7X
	ggkV5+k2BDtjGpBFRaombOjM/areH5QXL+txvygjo23Ur9XT4RTN4uSb
X-Gm-Gg: AZFdTZdfiQgk5gwICDUWTYFd0l2z+rz+Bxhwi7CmjJytpVUNNavq8iQjqQvbXSMH6mj
	j6q0YOdt718pt59V0pKPvpMbfuDHotXzYpcdP7QcPLq7jvEJzcdBY8AXyuLNoS0jrg/XByOxEKb
	uPfEOd/nrCIHzOQj9hB6LGBnqpMk9sTtla+9QW2Hmpk0lrfJGdSVjdOm6QXlw49luIEFygE3C6Z
	NaPpGthEF7occtOglQbBOQP2juFQ06vJotWVSFRh++vme9zTCW2+FLHKFUGpJZ9DcxymfyYMB5H
	+ZjnAlSV1OL69H8+TK1Q8Vpi0ENKoMsrCcm7XGrTr0Df32eV5URiyJGix7v6iej5veuasOkl675
	12zUPYUubwaFabJfjT0x10r45X28KU99r84crwAPygXXg3MclXVxhVjIsW0IFBhZCTcqqdlYmKu
	yN0TzkHIfKRlnzAyhEKw8kFrEaTwI6OCi+Ntwx5u/kEbWZHUV6EG9x+Xi8rgZJUN1VmucMB2TDI
	zOpHf5uhPuMzo/RcACMRlAPppjHPalNzNGJoRjoI+crZ099Mt2WxRK5XYl9mIMWKVCY8kpgz46+
	CiXi8IFLSqkBgXJsVawJ1nOTcmSp8EjXedD1SRwtX31WWLtwEund+3tuNQdLwwO6978eTDo=
X-Received: by 2002:a05:6a00:3ccf:b0:89f:feb6:5d5d with SMTP id d2e1a72fcca58-8c87c95b6b8mr8202972b3a.33.1795364940056;
        Sun, 22 Nov 2026 08:29:00 -0800 (PST)
Received: from localhost (218-35-178-218.cm.dynamic.apol.com.tw. [218.35.178.218])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8c8706844a0sm4219437b3a.1.2026.11.22.08.28.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 08:28:59 -0800 (PST)
From: Kurt Lin <lylin1023@gmail.com>
To: Sasha Levin <sashal@kernel.org>,
	Tejun Heo <tj@kernel.org>
Cc: Johannes Weiner <hannes@cmpxchg.org>,
	Michal Hocko <mhocko@kernel.org>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	=?UTF-8?q?Michal=20Koutn=C3=BD?= <mkoutny@suse.com>,
	Shuah Khan <shuah@kernel.org>,
	cgroups@vger.kernel.org,
	linux-mm@kvack.org,
	linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] selftests: cgroup: fall back to an unlinked file without O_TMPFILE
Date: Mon, 23 Nov 2026 00:28:17 +0800
Message-ID: <20261122162817.2012387-1-lylin1023@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <20261105011824.1143947-1-sashal@kernel.org>
References: <20261105011824.1143947-1-sashal@kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, Nov 04, 2026 at 08:18:24PM -0500, Sasha Levin wrote:
> get_temp_fd() creates its page cache file with O_TMPFILE in the current
> directory. On filesystems without O_TMPFILE support, such as NFS, the
> open fails with EOPNOTSUPP, and with it every test that needs page cache:
> test_memcg_current_peak, test_memcg_min, test_memcg_low, test_memcg_high,
> test_memcg_max and test_memcg_reclaim.

virtiofs is another one: run from the kernel tree shared into a
virtme-ng guest, the O_TMPFILE open fails with EOPNOTSUPP and the same
six tests fail.

With this patch on cgroup/for-7.5, test_memcontrol passes from virtiofs
(15 pass, swap_max_peak skipped as the guest has no swap), and from an
ext4 directory it still passes as before. No cgroup_test_* file is left
behind in either directory.

I found and tested this with the help of an AI coding assistant.

Tested-by: Kurt Lin <lylin1023@gmail.com>
