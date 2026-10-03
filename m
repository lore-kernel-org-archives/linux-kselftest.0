Received: from mail-pj2-f35.google.com (mail-pj2-f35.google.com [74.125.227.163])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C983F34D926
	for <linux-kselftest@vger.kernel.org>; Sat,  3 Oct 2026 20:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.163
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791060357; cv=none; b=GtZJOEveGGIkICIfrdbgGqAiVmPKNIt1vgpPOyOqW/BTq6yqqEzqpqldro9GxwMmYCAe9NJU+3j7jm4XaQLuJu++1R5V79WmOplVrab3/yKMJzqHxcjgcytKcn2Uol62TfBbCCUM+ksXfC3fWel2FDpihgW19A67uZ2jyMN2S/o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791060357; c=relaxed/simple;
	bh=FRp4Cct50HXCeTViDVPkOvyv0qHQZnD+X0WubEU1Bpg=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:In-Reply-To:
	 References:MIME-Version; b=KmIbL+4gp3DX44ZPqzR2tuK8j3c9JpI1ywK8/56t+XshDPcCvlPfXiAM15/i+HK04J5eGBX3CEY+wORQw8H0JoFQjfVhuGjG6qmQUp4t4ERnWbiUpqFt/CcOnBNO+1mcpeM78X4hGfmd54fvM4MTqT4ZVa60xXEubV9l3FrTtm8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=n8Zkw1si; arc=none smtp.client-ip=74.125.227.163
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="n8Zkw1si"
Received: by mail-pj2-f35.google.com with SMTP id d9443c01a7336-2dd77300825so2545835ad.1
        for <linux-kselftest@vger.kernel.org>; Sat, 03 Oct 2026 13:45:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791060355; x=1791665155; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FRp4Cct50HXCeTViDVPkOvyv0qHQZnD+X0WubEU1Bpg=;
        b=n8Zkw1sihXcl4/Pod6zhjI9skgCU8j8F1VKkIOWyX5CldojzAfWimmAks5nfi9OI3O
         LbN7M7jT2pSdPqOjAibpwHGhCfkmKEeJa16o1lM2yFRjyEhm4MeQNUwLEe02xZF4vbj4
         NeZadT6r48WSu8JRikuJCVsKoEhQMgAxyyGz7+cPMHDGRx2a07APhzA/cXMI5ZAkknsi
         +8Qoz0NWe0WKvKeW4oFLFGxdiBrgDzayaQPcO0bTL6xSS8av6YHG6ltu0YR4yjKo1gb2
         gbzTkclD39paWI8LoyivQfZbiFf+84u6SYhDpdYnX/ohVVesjMuxLL5xG1Uye/24m7/6
         Ta2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791060355; x=1791665155;
        h=mime-version:content-transfer-encoding:references:in-reply-to
         :subject:cc:to:from:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FRp4Cct50HXCeTViDVPkOvyv0qHQZnD+X0WubEU1Bpg=;
        b=2HvDnYceLyadrOyuMYeRVwUC0TM2Dak0zcvSbJNpntz+fiRRrVx5mt42le1cSlv4fP
         0eEkVxbiBtcHzy7geMGVW99Kl6TZDgucPBIfM0rR6O0mXcunI1CKda+oMdFTzX4pLZQq
         O+Cu7f0/ZzerwVaRycwG5p2wkFtn+ksKOOOgP+Tc9WqUKa4FuEu+3wZoyQjGt9ZF8Wz5
         vKUirGlKyf6upFhYg/PwMfMBmAcWu2CkDZq/WfNocv22T8/tl2B2hOcpZ7EWYX8NtuGU
         8gnrANnxp3ebos64AtKZk5gFA/a6W5m94aAjMkKLft0WO3hPuTSjz7ad+Mk7zQXwohhI
         WSwg==
X-Forwarded-Encrypted: i=1; AKwUvBwNrUSzY2G3/pAV95xY9Y6dA7WqWBvr7JTqomNasVsYFkmDKVJcz6da1dHrP13hOGeZTeDGzwHb7WBZYnY2JbU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJSLATXSFhuYrTecZnlTQzblYvcanbqBvr1oqUeQRHGY0MMU2nf
	j9YbsxlZ11foZ+8faHkOrsP+z3Nh1lOnrvcSlke4CGD40bxZLzuziwsX
X-Gm-Gg: AYBFou3ZsGi5L1oIL/Jf3WzdFt0FjuoMoDVn0t0QhfVzcOZsT0/y7+IUjX/mxhDFwnx
	xgRtXqiXmDTi0Idfp/89gnsy718TQvB8Lv93zCTIUYnpMtWaASGlNQmXY/dbFwYNTm9MI74WMu/
	wF/fmtcHsH/SSYVkjKUUue+BAqpASW6mFhq0vd1l28kk7Zm5oQLPlsjjCx2WM3JLhzlGpCwRUYb
	Euv+nCVhXcI1WlZJpouG9SETQ1Y0K4YELaMuLto9fx0uts8eQCgovBSvtK93BDZN36720uJup4f
	SDI1pr+9X598sZco8okQx2h2gO829POW001lGBpYdBNBVPaGnyW5sIgFad6kIzgsTzmxjLRLfEV
	g/3oDmAFVrIoGvHRlQWjfBlAh+zJwzuwKNHZBNYx6KadxGV+53BjexVb246drrg5Hj7lDDZhkdM
	Xkp65UAa1IyBBnBrI9NDKc5bOXJFrKOUMigkjZpeBn2hltAxQfC4DSHo9f0Fd3EpbQYgejuurkF
	fL0Nwjiuk14IdjeDahaqLjqzIWHgbuhQ0ol+hdVJIXd6QkNQVdgkT7jHFrndBKCdKt2bVhchfBq
	JGmP1x3xZ6BhrA==
X-Received: by 2002:a17:902:da91:b0:2df:83ce:724f with SMTP id d9443c01a7336-2e49b615cf2mr61626695ad.30.1791060355061;
        Sat, 03 Oct 2026 13:45:55 -0700 (PDT)
Received: from localhost ([153.61.198.243])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2e533e8397bsm7343265ad.78.2026.10.03.13.45.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 03 Oct 2026 13:45:54 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Sat, 03 Oct 2026 20:45:53 +0000
Message-Id: <DLVHWNL0AVKU.NV007WEHWST8@gmail.com>
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Tao Cui" <cui.tao@linux.dev>, <tj@kernel.org>, <josef@toxicopanda.com>,
 <axboe@kernel.dk>
Cc: <cgroups@vger.kernel.org>, <linux-block@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <bpf@vger.kernel.org>, <andrii@kernel.org>,
 <eddyz87@gmail.com>, <daniel@iogearbox.net>,
 <linux-kselftest@vger.kernel.org>, <cuitao@kylinos.cn>,
 <ameryhung@gmail.com>
Subject: Re: [RFC PATCH v10 1/4] blk-iocost: add BPF struct_ops cost model
 support
In-Reply-To: <20261003124045.1289305-2-cui.tao@linux.dev>
References: <20261003124045.1289305-1-cui.tao@linux.dev> <20261003124045.1289305-2-cui.tao@linux.dev>
X-Mailer: mkdraft (claude review draft; edit before sending)
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Sat, Oct 03, 2026 at 08:40 PM Tao Cui <cui.tao@linux.dev> wrote:

v10 was sent 11 hours after v9.
Patch 1 grew from 712 to 789 lines and device removal is still
not tested.
Pls slow down. Wait for Tejun before sending v11.

pw-bot: cr
