Received: from mail-pf1-f194.google.com (mail-pf1-f194.google.com [209.85.210.194])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BABF3E6396
	for <linux-kselftest@vger.kernel.org>; Fri,  8 May 2026 15:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.194
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778252501; cv=none; b=FL9GKqyPECihRM3OKRPdI5n/mmU5giWcDp7V2g+VFewQTCV+SDDy9dYgbDJclAzk+z2xD6ppy9HCLCYX7vWo5iZsNSwni3R7XMYGz7SGpmNCr3E75S6GbnDY5MH9yGNNYOuVYlNokcc3NPVNVl6B2/sj+PiQLOjkhNA5ejT9j/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778252501; c=relaxed/simple;
	bh=9/t/hUMZJzNMH4RVbdJbbZH15OTzwSdGifx4D0PefWA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jITMb5fg7DxV7kut2HSeM1Li+kYw8p+A3cYa06Jl/LiuSSNHd++FdkSz+TcdC3rowNBpTcukahvz0I+0Z1Cggj/GcnfkOs4detCY/OYhSNp4zzIRNLURlo6cix47ly4YoiYc7mxpSAwFbdhJIucHEul7zYLI5KcEJa85JWfiZd4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qwrtcv0L; arc=none smtp.client-ip=209.85.210.194
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qwrtcv0L"
Received: by mail-pf1-f194.google.com with SMTP id d2e1a72fcca58-82fa8d6425bso1047468b3a.0
        for <linux-kselftest@vger.kernel.org>; Fri, 08 May 2026 08:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778252499; x=1778857299; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=6j5p5DIVFbvgg+WGkwfocupb7aWHhDsZHNXCf6IHkDw=;
        b=qwrtcv0LXEIx8rCCicFAexqLv2BoxrUwNPWaK/3Ygzu4ERWPqmO80wV/OX+t24E3mI
         qtMK1pto0nicCgilFhKxLuLw1lBHY5yOjAFnWENpVmcgiQSbLXMS4LS/vcy7+AIfPXxb
         l+J4sTLrnmODq2yqFRlbvWcw2EoEBUnsw2WcHR1fsHEC3juIHGTgy/6UTwqPGGFE48nE
         cX/87Ob+bCJM3QFUL3BqkDEtE2wteyCnAxIkUGkbf8CrEA9om5Pdd/wH3a7o0kTrjBJg
         R+rFDUzD+kQ0D4DdlQDF9f9YBPo2Q4OWk0Lm5qUHRorREp2tlgqNMqen8FcW4lAUF2bT
         kqxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778252499; x=1778857299;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6j5p5DIVFbvgg+WGkwfocupb7aWHhDsZHNXCf6IHkDw=;
        b=VDUsK8vQXiyl8GwwWQiu52e63kiuhnSyg/cziq1NveVI4/VQEIkfPyPns5/pEWtjca
         /RPiNL0jAmK06r8EXXl4sL4TeSkue5o/c6kcB2W2qgouKK63/VUshLwWBKY7D7kr8C/j
         0pZbA4vUYnf0ZToDaiH7cOLB+WKHrTgX64rzqZuIAATyrKOp/3trjKkTre8hTyrj6wEi
         /OyoWBiASfd/o9PE/DFGAyBK9V0QFuw1w1e/t76VFb8e4YQ67kK+G+7d3vab3ylKLLck
         AIkXlTd6tMyyXqDGtaQ6pxdzTVdI3siVfHTJBtWXbk9GqoLxPc+ARmoeBdNbWT97pwhI
         I3sw==
X-Forwarded-Encrypted: i=1; AFNElJ+Zkik0SWlCsfS8n4+TJypZ3Anvhpj6rWFjwcOXUqwqTgZfnMfy6y6WpHgjzDynFN9SIz4UlauQOSQz5ovZiR4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+PigiF3w0hklmj+bvovC3bHTnQDX1vDMlzLd0Ovz+wwZe+2P7
	rIcEMCa+BgPaT9APpt6DMCWzZ+Lzd22DE5WsxvSfXpBsG6GrHgx4yIZ+
X-Gm-Gg: Acq92OFtpyssh0xFp1K6Vyk67SAewI1eV+t+OvRXnHzskrn5SsZDGMnBwfyH96Qziry
	v8Fw9EuRcgCnEc+SL6OxihPETITtxm04JPJP5hb89rFAlTVFziZFZaSS8MjPawWb6ZGdnEvwhlx
	A2sGDIgL4yDk9pxYHuOWf0iwK/wBlnVSOf7dEqgeC2pGxs9EShGENZVzHJ1hcOlPW8Or9BuD8Jr
	HDNMCVKQkpdB2GAsIF+hxUZEQpY31y+NLU5Wnwahn5LdqCwboXDRPRjBtZsUidbx/yJMdu+G1fe
	s5GHEkZIbY+Q3H69nZyF/VS3+TzmCzDy/qBCl6M/PxxbP6IQBIyVzhQSPkieCLC6WCUYMk0cdWc
	XoPBtDHVGEXa9KPzi3aC8bXCpqu8c+/B39vDorV3bsRIaba+NzBa2QQC0CvJDvUV0BsVcPCvu+i
	QdBrnR/N1XjOI0dETv
X-Received: by 2002:a05:6a00:39a5:b0:82c:2205:507d with SMTP id d2e1a72fcca58-83a5dd5bc34mr12224762b3a.36.1778252496977;
        Fri, 08 May 2026 08:01:36 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:5e::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965d35b3bsm11676274b3a.24.2026.05.08.08.01.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 08:01:36 -0700 (PDT)
Date: Fri, 8 May 2026 08:01:35 -0700
From: Stanislav Fomichev <sdf.kernel@gmail.com>
To: Bobby Eshleman <bobbyeshleman@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>, 
	Dongliang Mu <dzm91@hust.edu.cn>, Michael Chan <michael.chan@broadcom.com>, 
	Pavan Chebbi <pavan.chebbi@broadcom.com>, Joshua Washington <joshwash@google.com>, 
	Harshitha Ramamurthy <hramamurthy@google.com>, Saeed Mahameed <saeedm@nvidia.com>, 
	Tariq Toukan <tariqt@nvidia.com>, Mark Bloch <mbloch@nvidia.com>, 
	Leon Romanovsky <leon@kernel.org>, Alexander Duyck <alexanderduyck@fb.com>, kernel-team@meta.com, 
	Daniel Borkmann <daniel@iogearbox.net>, Nikolay Aleksandrov <razor@blackwall.org>, 
	Shuah Khan <shuah@kernel.org>, dw@davidwei.uk, mohsin.bashr@gmail.com, willemb@google.com, 
	jiang.kun2@zte.com.cn, xu.xin16@zte.com.cn, wang.yaxin@zte.com.cn, 
	netdev@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-rdma@vger.kernel.org, bpf@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	Stanislav Fomichev <sdf@fomichev.me>, Mina Almasry <almasrymina@google.com>, 
	Bobby Eshleman <bobbyeshleman@meta.com>
Subject: Re: [PATCH net-next v3 4/8] selftests: drv-net: ncdevmem: add -n
 flag to skip NIC configuration
Message-ID: <af36xtqCzGOGF2m-@devvm7509.cco0.facebook.com>
References: <20260507-tcp-dm-netkit-v3-0-52821445867c@meta.com>
 <20260507-tcp-dm-netkit-v3-4-52821445867c@meta.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260507-tcp-dm-netkit-v3-4-52821445867c@meta.com>

On 05/07, Bobby Eshleman wrote:
> From: Bobby Eshleman <bobbyeshleman@meta.com>
> 
> Add a -n (skip_config) flag that causes ncdevmem to skip NIC
> configuration when operating as an RX server. When -n is passed,
> ncdevmem skips configuring header split, RSS, and flow steering, as well
> as their teardown on exit.
> 
> This allows ksft tests to pre-configure the NIC in the host namespace
> before launching ncdevmem in the guest namespace. This is needed for
> netkit devmem tests where the test harness namespace has direct access
> to the NIC and the ncdevmem namespace does not.
> 
> Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>

Acked-by: Stanislav Fomichev <sdf@fomichev.me>
