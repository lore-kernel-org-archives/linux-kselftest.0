Received: from mail-pf1-f193.google.com (mail-pf1-f193.google.com [209.85.210.193])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 689B83FB7E2
	for <linux-kselftest@vger.kernel.org>; Fri,  8 May 2026 15:01:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.193
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778252516; cv=none; b=Flo/0RFIjK445bVLK6KheVGpuHF99+lzN8d9e80jrTDKEA7p8alP+LoPGuYZptXnKo3PTrJsqkJ3MgShcAlckHKKExVwhzZUW4roQWhETbplx27WCYVjvJ5t+kSu5iU02dFrR5Yc2t5GAlJu8RtKIWMZ0PE1ar4S7snB98u7J7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778252516; c=relaxed/simple;
	bh=d9whpuIEMfnGfHXELXi5THs3ikD/M+a2M1VvwY0qAIg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Y2TUCi+c0GQd8NkoEowXftFQWIGbFRdTAhL4qoc6PwiSMxwR8PWlbwP9t76Y8fw89ISXj/94Ma2gH/h4+sFxhuYnBZY9JxaIry5puUXo+hUcmOp/4fc8PXn67F3lVD4jDDRD8phdjp/RZhpzF3+AOHS6ycLh67qB6iy2StemHuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WtvgRmfN; arc=none smtp.client-ip=209.85.210.193
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WtvgRmfN"
Received: by mail-pf1-f193.google.com with SMTP id d2e1a72fcca58-82748257f5fso2039341b3a.1
        for <linux-kselftest@vger.kernel.org>; Fri, 08 May 2026 08:01:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778252514; x=1778857314; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4IgYMYGpVzi0WUd6069NetUOnbBf7yLrDGRB7C9U8+o=;
        b=WtvgRmfNtVaJWb1dPvdW9jp6oi3NamOj4+9P48ymK+bqqRyouUpdPTrba/wLO+tjNO
         4AhSo5jbYrbhQdyezHA4o0U+hMRAK+XfltKwW4LUQcQZNnWyWlRQO6Dz+Jl0e6mdY+q8
         izDrvlHHi3/hccRHk2waSpaSd25Q3m0d5aoSrwPzuqwmaZXK79xy8tkbQ0Gzkr6cAN5C
         HPRLW/VWqnPyLBLwEleEWC4aQ+pVuZgq39QtNNHoLVUK5VlxT3m4dH4wOl17sFPHicnl
         Hl07PCo9kN5Ir1Rp7QNaR9RlTj8cbmEnXTC8D/+U2eNawBuCdA7gziEWV45+c0zOBbC1
         HW6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778252514; x=1778857314;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4IgYMYGpVzi0WUd6069NetUOnbBf7yLrDGRB7C9U8+o=;
        b=AcnVWZmkDu2GfD5mZbtFrDpYLQU4uszctLkn3TWiJTrrDgIJKgo7gj+HWPDxQRgr+A
         +9A+oSOFatfjsyndMlEt4c5p+tqB1Zwg87xNpBa/i5Twf/8TdCelQVzWG5zOuGuPNatu
         FMeSLqfoLemu0lLRnqB40S4HRvyUEK3U9Uz0MmAIUjNSZ6GQ5Brvfus1HRi3wZI8tPtC
         HwvH63TyDcddOQAf2QZSmXrxspTZ+RMFFSQ3RtbbWWb37koXuzj/GdInUz+OVWEx6px6
         G/1p7/XpPmsh+Z8N50NULpCX7YDr2DQJvNlB2S+apFeyanLKaR0NMrY6XtyO1xMk9hDR
         RotQ==
X-Forwarded-Encrypted: i=1; AFNElJ+/xCBTBLODt/UpYPTQdHZqYXUtjsjvDmXSp5VdsHFDDl25cLgu7wOnlqwrdq4Vj/cuwtqJ9Ci/ekYg/XG0ro4=@vger.kernel.org
X-Gm-Message-State: AOJu0YyQXFa7BQZIBtleYeTFMwh1CvNRbW80cZvS34PwFUL66kajbMam
	p+X9acHh/1Ryb9OKPumZRVKOE3OAoI7OCNzNlrT2i61jLsvIEaJhjunk
X-Gm-Gg: Acq92OGlYv5K1Q+R+MxkGdJF4hxZdKNCCTXQ/LAPoHeseod6Zooyjp4k2jfuXVAUyBj
	OnbAV90jU3x6hSYSk52odD5bod13lPcl1n74cI6VMcc6qkk8FaGkFT+iNAIKULEheIbHGC67Cgi
	Q4teLjHL4fuJ14lgh58/Tg8XKJQ4zOuZVK3ZeAPbbsELh9NtKIbslrfbS/4tyvTlzWJUzfpAghR
	v1tbNcIBlmJ/zbDKO2jdVatoYh4pcb5ONVNF8CAzES3/nRLmGcu5Y2xuih5DjZYARE2hjLITDBX
	nJ4Q268SPIrksFDj9DA23C61Ywzg52SXVrsh9v0TOltTMp5Lror9BJn3WlKNxXxBeyRL3STBZXw
	PGQAPfTMstN68Ulgs8FgV8TG1Q3rFW7RUUfOSudTJa4swNiYxx0X5uoQM4kiOyVYToBum4uqTev
	CAz8DhvpPPLtaFs4Wb
X-Received: by 2002:a05:6a00:4b54:b0:835:51fd:b7ea with SMTP id d2e1a72fcca58-83bb7cb6c8emr5917960b3a.19.1778252513119;
        Fri, 08 May 2026 08:01:53 -0700 (PDT)
Received: from localhost ([2a03:2880:2ff:4a::])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-839679c8c1bsm15730006b3a.34.2026.05.08.08.01.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 May 2026 08:01:52 -0700 (PDT)
Date: Fri, 8 May 2026 08:01:51 -0700
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
Subject: Re: [PATCH net-next v3 5/8] selftests: drv-net: make attr
 _nk_guest_ifname public
Message-ID: <af362BZdBFooC4mH@devvm7509.cco0.facebook.com>
References: <20260507-tcp-dm-netkit-v3-0-52821445867c@meta.com>
 <20260507-tcp-dm-netkit-v3-5-52821445867c@meta.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260507-tcp-dm-netkit-v3-5-52821445867c@meta.com>

On 05/07, Bobby Eshleman wrote:
> From: Bobby Eshleman <bobbyeshleman@meta.com>
> 
> Subsequent patches will use the _nk_guest_ifname as a public attr for
> setting up devmem. Rename to nk_guest_ifname to avoid angering the
> linter about the '_' prefix being used for a non-private attr.
> 
> Signed-off-by: Bobby Eshleman <bobbyeshleman@meta.com>

Acked-by: Stanislav Fomichev <sdf@fomichev.me>
