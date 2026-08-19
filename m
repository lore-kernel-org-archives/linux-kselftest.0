Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6545B3EC699
	for <linux-kselftest@vger.kernel.org>; Wed, 19 Aug 2026 23:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787184000; cv=none; b=WJx7djjC10v3xIoVjf8QVaxDrMFR48Px1P4jQINl8A4bjFD7DSzBDKruwI2v5UMNWLKnZDdcKT7mfAuuIAxnNIICHCPSq5mQTT3PNHqyq20+D2S6T6aepHjJxgK2x/PXVHWa+OuV+U11fJmgQ3lm5/BMYy+YQdYgmHn1B1TQSFI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787184000; c=relaxed/simple;
	bh=NGp/aL9J6o0WYmHnohWsvAE5IdAJbRwI8aWJlovJsXQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=H0SxLMP+lf4MaQpeNnGuraLSSLuDtC2PrTjqBs8OFIETSnBy0Vf6ueanPISnCmPlUzRl148lwINaYbenNJN/SAkAiS9QGKJIMVCbybfni19Hyk6W9tm1930FfBC0JAYIh7hdMtvRXnk5FxcEIinP7JykZ+whwqs8mqUcqTSku9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UOo4Affm; arc=none smtp.client-ip=209.85.215.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UOo4Affm"
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-c9cf07d2df6so906422a12.2
        for <linux-kselftest@vger.kernel.org>; Wed, 19 Aug 2026 16:59:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787183999; x=1787788799; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sLv4USOHSGhU+T0T1FSL7i8gQWx1GCa8Cf4zSXBJYXM=;
        b=UOo4AffmBRNzbrzeIGhyS9M+DR3r68ADGTp0Ohq7tgP9DAdDWXa62tsUBF8f3vanYM
         G1kni+ApT+WrhlibrZr5aJHzcww9D+Djuy6yXjK0/ZQHlN8Bvy9hmeRspLcS/mky+9aQ
         Kq8qNuLX+LeRoA3wNntmNHgPaQn0S7AU4/osJv13dN8egm3wIFb5QdA2oB8o01+07EZ3
         ujCa0smf3o0KdVsDDuuWcKKX0V5t8BVJPr18KfLQrwrVIEbzwpANKc4MXQFQbss/FOiv
         i+mquYQeSYBMCDZHSSfqUDEryfW15Rxj0Mw4w0/huCdoK7khE/pZAjKB+q7iaUrp6jNR
         8L4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787183999; x=1787788799;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sLv4USOHSGhU+T0T1FSL7i8gQWx1GCa8Cf4zSXBJYXM=;
        b=Tjsh8hoROAucTPyBqoQXVwZ3uUDEXKtlkjMPrSI0BD3kjcb4ZN+NcMZGyoGDgv4T/B
         GtyGKG7/5vgW++/rcjv8VgX2dhQN57DEh1wGPJIFy/gPLhNhH1hKkb+qWoL2CAX43yaz
         5djhzzQkaRK+fMQ47mKAI/4sgbPCEAgD8wqkrO+tCsXUBTrcw6O7h4EThVevU0FMVIjF
         GW/yF6u31e6sCemhuP0asscYhjIWinSIHG1kB1IaVTBfddxWwfezlxN+zincAktPXJyc
         xFsvH88/reGn1wd0l1kEqTAOfDiE85p4By4yEzRITZr8MYOIr1uXF1t45Z06+bCK11iO
         +hUQ==
X-Forwarded-Encrypted: i=1; AHgh+RrDjMhfamxuOM+xoclroDGXKhntv1ueI+LtUVdy6/Op2NP0QpUHvV1HIJmeRRIlVtsId/f5+A91FFucDVoa9DU=@vger.kernel.org
X-Gm-Message-State: AOJu0YxBPCC0yXB63YgVBe+jsyFo4/YBK7XfURN3DuGVAkBX9xQpfsAg
	m2bZi+A8dt/OFrPan3zZAWM8h8nmWrW6J9e6Umw3+vvKlzOP7qYMuuAs
X-Gm-Gg: AR+sD12gI+ghLwgMfMW5dkvBRruEUw5fLc8z/Z+WjBYcZsod0fmK32GHd/6GmNAgUgl
	mgj9k+vwMnjZEc1uXebMRSJZeusMnvzgyyIQnDnchsm18DO6jBa4iqDB5GYyGye889J/UJ5vDe6
	hUTzLLEvdKgxHYIQtJYILFRBSqtyiaUbgh6/j8Bnzk1JBtK/9HFuCzASMRRBLQZq641TnT1Mduj
	eQWOpNO0u8hzD9AnaK5d4JwSplOmo7Ti5R4a/n8J6SjXgEaQytjXD7L8ir83L6pG2R/JkvuRYmX
	JUHZRPzgw+LnNBlox9n0e9yDc7V4W+vYqc7x6SAVUkS6UytNIa3jMgdb4xw8lgNilbN+fGATl7s
	vxIRW3TDmeXrob7qlPrdjTR4R5bHYK66snZBw1XTGm2MTV11Y0tnwLdhJVATliDkgjQ1l4TXTEU
	rRpi5/lRJhgHm11mY5Uo/6BC7vIEbuTOGr6VR40xu11/V7K9e5FU/ADVbj72CdDZZVnHcuJKDBg
	xUO3NoF
X-Received: by 2002:a05:6a20:734e:b0:3c3:954d:278d with SMTP id adf61e73a8af0-3cd010ff4b9mr13863807637.9.1787183998514;
        Wed, 19 Aug 2026 16:59:58 -0700 (PDT)
Received: from devvm16600.scu0.facebook.com ([2a03:2880:9ff:66::])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bef3ce17sm15822174eec.1.2026.08.19.16.59.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 16:59:58 -0700 (PDT)
Date: Wed, 19 Aug 2026 16:59:55 -0700
From: Ziyang Men <ziyang.meme@gmail.com>
To: Tejun Heo <tj@kernel.org>
Cc: kernel-team@meta.com, Jens Axboe <axboe@kernel.dk>,
	Josef Bacik <josef@toxicpanda.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Andrii Nakryiko <andrii@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	Kumar Kartikeya Dwivedi <memxor@gmail.com>,
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Jiri Olsa <jolsa@kernel.org>,
	Emil Tsalapatis <emil@etsalapatis.com>,
	Shuah Khan <shuah@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>,
	Michal =?iso-8859-1?Q?Koutn=FD?= <mkoutny@suse.com>,
	Roman Gushchin <roman.gushchin@linux.dev>,
	Shakeel Butt <shakeel.butt@linux.dev>,
	JP Kobryn <inwardvessel@gmail.com>,
	Mykola Lysenko <mykolal@meta.com>, linux-block@vger.kernel.org,
	bpf@vger.kernel.org, cgroups@vger.kernel.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] block: add BPF kfuncs to read blkcg io.stat
Message-ID: <aoZDe0yvb49flaOs@devvm16600.scu0.facebook.com>
References: <20260817214205.723267-1-ziyang.meme@gmail.com>
 <20260817214205.723267-2-ziyang.meme@gmail.com>
 <aoSUob1s8WBQ3buO@slm.duckdns.org>
 <aoTdQeLZZuRirNHE@devvm16600.scu0.facebook.com>
 <aoTf7u20mo9s6ADj@slm.duckdns.org>
 <aoTkZhQDoaQKpPe3@devvm16600.scu0.facebook.com>
 <aoYVh1ihBH-TWvi3@slm.duckdns.org>
 <aoYsIYnoFDvjkzKp@devvm16600.scu0.facebook.com>
 <aoYzjaXQNmm9bDcE@slm.duckdns.org>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <aoYzjaXQNmm9bDcE@slm.duckdns.org>

Hi Tejun,

On Wed, Aug 19, 2026 at 12:51:57PM -1000, Tejun Heo wrote:
>Hello,
>
>On Wed, Aug 19, 2026 at 03:20:17PM -0700, Ziyang Men wrote:
>> Yes the css_rstat_flush() is exposed but currently it is marked as SLEEPABLE, so
>> it doesn't accept a RCU_PROTECTED css we proposed. This is not a problem for cpu
>> ones since &cgrp->self is a trusted pointer.
>
>Yeah, bummer, so we get ref on cgroups but the subsys pointers are RCU, so
>that means those refs are only RCU protected. I guess we can't avoid a kfunc
>to get acquire a subsys css from cgroup. I wish css_rstat_flush() didn't
>schedule but it does need that cond_resched().

Yeah that would be a pity. I will add kfuncs bpf_cgroup_css() and
bpf_css_release() to handle the reference for the css.

The bpf_blkcg_flush_stats() will be removed as well.

Thanks,
Ziyang

>
>Thanks.
>
>-- 
>tejun
