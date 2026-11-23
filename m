Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795428924;
	b=CZtbp/1rzAZOn97IqKIJ5JDkfnRV9rxPN2m3eoeIsFZVbv+q48SXDjkPBSAnd/fX0yLh
	 ImzbvLmU7wobeYkpNPvtPkSjIEUj/JPam7tLsSvYASDBL84Cdt9z+hb/d6rx7Us6Lq/Oh
	 HGtHTXCd7AHKOXS7gTEvYextn0MoxHh/+mFyrxg1tsWF3l6FwAAmGRHFQOOakbcNAvFcn
	 fjDNI4xrQ8SJXfFj+5vaHbibFHmQ9m/zRDYcDHV5RUQ9oa1uT3xD2Emy4vxdIiD1BGATl
	 wq63Pgcp+mQOi8Us6CHyIsjgCdD+h34EFLc+5qyPTJrfryM6MZlJ70bnJNW+pIMHWNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795428924;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=YEmk1VDoJHLEYSmDRdBwUZmDsqu1t/NGQfUH3rocZOw=;
	b=SO0iXnKR2d9jcs1rqu0xivOV8goCauIwnOmZT7pRyLDCWmvCLzlfe7367m6y6Mz1SHdb
	 8lhW+HXspZdtblI9wKk1Llf31DZRsdl119HeeVorpqlG9e833cobeal03NZAWq/HtX8kZ
	 vJ3333u6ja/3R0wYcDEZaFHsPL/xu5fDg2MFetakkYYSXJ+rrsdFmLRLulmF7plSStAmB
	 8AyEh115BUxKW1ez9MoxJ6IChdekdkESrCpAWiTR0z0xTfVzZqfNJYin9EwimWGOdWcL8
	 M3slQTc9QeaUaTVxdfVYuFCmRf7e4/AeNTnUqaNCefiweupGL7i+pIVKO/toLnG2PDw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=suse.com;
	spf=pass smtp.mailfrom=suse.com;
	dkim=pass header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Tj1tka9c;
	arc=none smtp.remote-ip=209.85.128.46
Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B466B606A32C
	for <linux-kselftest@vger.kernel.org>; Mon, 23 Nov 2026 10:15:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B466B606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.a=rsa-sha256 header.s=google header.b=Tj1tka9c
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4a35a60499eso23644175e9.0
        for <linux-kselftest@vger.kernel.org>; Mon, 23 Nov 2026 02:15:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1795428922; x=1796033722; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=YEmk1VDoJHLEYSmDRdBwUZmDsqu1t/NGQfUH3rocZOw=;
        b=Tj1tka9cwCfSWVyOhNY4eRE05/jjgj461r/WnGC437Cg+uv520KTUAtreYXE4Uq4SQ
         VQPr4yG2Y0WusL/sss7VMDxH1FpnVaj07Df/tNh17yAjcNGkwUdYLutIBsU9wv5Br/Fp
         /3EHSls/7CqlnJcqVnP6DNcbP/cZtabyzOy7yIPtVQ0HUdS0h2pLtqRSxH33sUWzR4Bl
         VeFDHbK2pSt1RXv0nj4zGr0S5c43fOYQ5w6zOWGj4gda05ZvKucxdkX5pEkLO1PMgYGZ
         73Ko2Dj5NxRb64zkKdjz+wIrcy2vFOpvHLmQ+456M/dgvqKUIaFLpDle24Wwoad8e0pO
         MsKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795428922; x=1796033722;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YEmk1VDoJHLEYSmDRdBwUZmDsqu1t/NGQfUH3rocZOw=;
        b=Ll789xYtee6olTlK8cEiEC6FkQ4zQIorFDxClSSy6s9ZRJAflnrZqqWLt8pUzoLlGm
         v2uMCnwHkpfx1Ho3JbLhutWPdUG+s2e2Au/0Uh9R99YcPKl3eyKYUjvwWvzwVXoredl2
         0ncQza0pjTlmZ7e694cBD0de/tfpcy+cYgZ6NfNAZTT2BeRoC2qOmlx9QjQ6wxx4E0y3
         QqWWlbDaW1nFFxVR5RhQxJyLOCf2w9RuA/Cqf3IS9jW3o02jVTXXuici6mZ6I8bUNMN7
         uv96/Yb/OgqJy2T0LDMY1Cj6KrcrfN7pWx44dpUUSaHZ9o0jol76FHQZRe8Vtat01xoC
         E7Hw==
X-Forwarded-Encrypted: i=1; AL+hErHtwxjCXX0uj33bvvow8VgH+gmlzU8mtMUEjb/4xfqOeWqwWRl5b/YVKmaWSp+1p4PkUa1XbtobxmKXwcUYplU=@vger.kernel.org
X-Gm-Message-State: APuU4Z/QOb8dyNeEx780bs0uozC8uk2TM7S+eABmtJD/4T+21I8o8oDM
	TS+KGHE2k8lAT6cFZ6gJYbPg+mv9XhoVfgUA9sUHMPN/SLY9fNMgD8oxZkFSyQjkofg=
X-Gm-Gg: AZFdTZcLSCY3aL2oFiAtF9cfz7rZaqJHv/k1S5CGpJiGUh4qCtD1r7ay70GAtPL7Tzk
	bN4TDWW7ESR9G2jkEDumD/iLszojy3F5TqoKWLJ69U5Wc9eWsRMesRWrjEak5lbwPCKVUrwxsEN
	65S77OBsr4V+2j0l6gu8+pfolvFRSK/IhfTyn7b2mVZZxufp6zM0wPeCRVbdJmshMtAVz9x2YaA
	tooo9FASKEbz2iyCsqjS1Ihfs+3IPadfE5wNmDkj3ApoeDsof5UpA5c25ncJ8adbIsp5yf1bl+d
	Ihk6H39G9EZjXbwn3NyK7eIl6tAiyl13MmjrQOGx03GcNp1QaxnSZUsn/2U+Ol6bc+jUUMOnsTW
	Q/X/x3stg5iTxArQb6toKaCpB/t/YS2rXaIPkZrcGrVXnPNZnqOLDb11dJkPDz9qm5UxTwdJF9Z
	JjB+14C2sryBDrQ0peZKAlyW2097w8GTAf6Agmy11fA9bgIvw3dsonST8+9o0QgyLw3zGKNRMSX
	wxqntalYnBTVYqWKdwaVb2gfOXXdf3yVyoZ2gIi7tAANaKjvNmMYm8BuIalharPym6zRhpm28HS
	RlyXcVxxNvAUM1H1xBzsrqxSF70mq+G/vsSEsr+y6J5a2VSbicJ/
X-Received: by 2002:a05:600c:45d4:b0:4a2:84c:52f3 with SMTP id 5b1f17b1804b1-4bb8880988cmr238927785e9.6.1795428922043;
        Mon, 23 Nov 2026 02:15:22 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853b216esm381534625e9.12.2026.11.23.02.15.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 02:15:21 -0800 (PST)
Date: Mon, 23 Nov 2026 11:15:18 +0100
From: Petr Mladek <pmladek@suse.com>
To: Sasha Levin <sashal@kernel.org>
Cc: Josh Poimboeuf <jpoimboe@kernel.org>, Miroslav Benes <mbenes@suse.cz>,
	Joe Lawrence <joe.lawrence@redhat.com>, Song Liu <song@kernel.org>,
	Marcos Paulo de Souza <mpdesouza@suse.com>,
	Eva Kurchatova <eva.kurchatova@virtuozzo.com>,
	Yafang Shao <laoar.shao@gmail.com>, Shuah Khan <shuah@kernel.org>,
	live-patching@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v4 1/4] selftests/livepatch: skip the tests on kernels
 without livepatch
Message-ID: <awQSNi8Ex6eOcFOw@pathway.suse.cz>
References: <20261110161050.2451750-1-sashal@kernel.org>
 <20261110161050.2451750-2-sashal@kernel.org>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261110161050.2451750-2-sashal@kernel.org>

On Tue 2026-11-10 11:10:47, Sasha Levin wrote:
> The test modules can only be built against a kernel configured with
> CONFIG_LIVEPATCH, but the selftests try to build them for any kernel.
> 
> KernelCI builds the selftests for many kernel configurations, most of
> which do not enable livepatch. On mainline from November 8, 36 of its
> 69 kselftest builds fail to compile the test modules, for example:
> 
>   test_klp_callbacks_demo2.c:23:16: error: invalid use of undefined type 'struct klp_object'
> 
> These are arm and riscv kernels, which do not support livepatch, and
> x86, arm64, powerpc and loongarch configurations that do not enable it.
> 
> Do not build the test modules when the kernel in KDIR was configured
> without CONFIG_LIVEPATCH, and skip the tests when the running kernel has
> no /sys/kernel/livepatch.
> 
> Fixes: c4bbe83d27c2 ("livepatch: Move tests from lib/livepatch to selftests/livepatch")
> Signed-off-by: Sasha Levin <sashal@kernel.org>

Looks reasonable and seems to work:

Reviewed-by: Petr Mladek <pmladek@suse.com>
Tested-by: Petr Mladek <pmladek@suse.com>

Best Regards,
Petr
