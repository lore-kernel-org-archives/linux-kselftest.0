Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC36D384232
	for <linux-kselftest@vger.kernel.org>; Thu, 16 Apr 2026 08:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776329012; cv=none; b=PpX06HUueUmBD+ZvZDKWBGe+brVSzu5V0xDNZJewCHLRIQ/3PTWOnVkrdv1ZKi50sm3PcfCa4WpKQZtN4U3lFxxpCaPEh7yhxN5uCOj7G1G7OhxLCJ8hAydLYuLtMeFZtx2qqOgEXtz7tyeW0xvMpXNLm5qgULLqxRsfr/O4pPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776329012; c=relaxed/simple;
	bh=jy/rxoo1p+ve/buQpTXSWcCvo/2NKUN0XefnO0bJeYI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pcHjB42DolsZSBO61uKXGJfINXGkzDzc+BwlhVX+c4qcSGZ/anmJZlkzhpD+I6m970vlCfz3V/mCfhV7q61LOK4NHRmQUiG2t0osRhLJ2SjFgNkz49I5Jm0ciFPYdpfqRxFxSHqpMMPuI9aKZnsj/aHHE6csAzcaCpj/Ro8vGYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=HxUqOQb9; arc=none smtp.client-ip=209.85.218.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HxUqOQb9"
Received: by mail-ej1-f48.google.com with SMTP id a640c23a62f3a-b9910707d82so982155066b.1
        for <linux-kselftest@vger.kernel.org>; Thu, 16 Apr 2026 01:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1776329009; x=1776933809; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Uu1RbogMjn1UvtlxIpHTcIOE9rQqKJsfEs8vLHXRnk8=;
        b=HxUqOQb9hSR2kgprFbPoLPGmAQEVFu5rStOLOMWn9UNcEszo3B+jCDaGSEu3H6l/Hi
         5gMGmr8COlvkldH6y8uGsK6rbuiiPrrWARBa5zggr0mbHw/J83bCTCQEffNcMBGarOZf
         RLgm+Yd4xpkBWOnATieXV50QUPwjdmVqOdzINowmo9fP6ArTBVnp/Jkaj7EKFAZxwrka
         b4G1FEztgmuGjR0RsIQC0e0p9GCzat8KegLhHu1+CAXWsdDpT9xEYWMp74hkhMVW4wnk
         Hzg/3qKfjRd0Ry2yeebR0GsL52A2+nbup213cAWaophXM4wnBZ4C3Es7zh2kkDDGBX2e
         hGvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776329009; x=1776933809;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Uu1RbogMjn1UvtlxIpHTcIOE9rQqKJsfEs8vLHXRnk8=;
        b=c+E0QfHUKh6PYjqp6mZldABezcu7zEmeKY1ht7kReRwuJwRmpHdIba8/f+s6+6bjhh
         UscDlJe3inUiY8D2Laddg+ykhRDEt1yqSwyRFN+nQhtdC3FeijD3LX/orf5Bx2xEyLOw
         wccY+HTn3LqWHdHAcaKeyPmaaYJgF4hN47XX/pR+N1mkUgShxDKz4CozLckMkSsxL1g/
         TzcP2bXWpuMaJBNtRq/PO8QjcXOQv/BYqHckFr4RwrkJL4WmXabU7ATw48VXoQiCsOuI
         yPvne7XEi5K63ce7dFbZTXQRCkHCNlpRL1jZYeNVdbzo0P53+wmi9D2mVOcbMdFmw8yu
         SRqg==
X-Forwarded-Encrypted: i=1; AFNElJ8IdNaC0HUKQgMdXAdFkWEGOz/FreVe2g27tAPiaOXQ2s70facXbrq6A8LguAcWdOP9UzFS304zWx9jXNYs3QM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzg4habZ0ZQmtBtORoaGBit8z3va/3NJ2k1GQW7r0cdZ0Lr4rBb
	X10+6WBd3OFYdGWzmZ6/2W5qfhPLfac9KyRZeuGmpHBDIDsqBgsr0lI1K9YbhbvO+Q==
X-Gm-Gg: AeBDiev0LhJ0KUSMA0RUMmk66uK4UalMQ6ZX4mbr2YMX/AoSSiJ6KZq/RPsGHeRL4KP
	BRHYiTeb4GPm+eSZIgkIqOwI9mKLaNWdDwEHFYB5n0LJh5h2iZyOhJqhgKg/spK/zDFzM9beJ7x
	eRRFIbDtaCeFQI8RVczRRn1s1kwE+N7mQdTNJc5MHCqXzrC8idHo0Akqj9Gr83HS2y8MxMk2JSh
	Zb2MlpH1o5K1nq6v7fR6+afT7JcS3O0TgrYJIswz9Ter73OtaUH0NoVhgXrj02Ajg1xktBprBFW
	7Q3MnvBCc8+Em2GdBp5Ld8VVJYete9Y6cvZLneZwFpLRrB2VIGpN2Tzhp9XHIsDDmuXZc5seJo0
	51Qw3ov8S0Va9AOwPnaPIYBd67ZFo/iZ31BcHkKZk1HkKjPyv3dQYfTW/ELv3AqaNLRbs6Pykw0
	qv6hYbvjZIniFH+A0NWHCLFFQOS7CTVL9hjwCT2dBfRBks1MxPQ5NIKU9KqWtztcP8SEv1N7B+e
	OOieXDX9R0I
X-Received: by 2002:a17:907:ca2a:b0:b8f:e98b:4952 with SMTP id a640c23a62f3a-b9d729bd5a9mr1014295866b.41.1776329008744;
        Thu, 16 Apr 2026 01:43:28 -0700 (PDT)
Received: from google.com (57.35.34.34.bc.googleusercontent.com. [34.34.35.57])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba1773c351fsm140213566b.30.2026.04.16.01.43.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 01:43:28 -0700 (PDT)
Date: Thu, 16 Apr 2026 08:43:24 +0000
From: Matt Bobrowski <mattbobrowski@google.com>
To: Leon Romanovsky <leon@kernel.org>
Cc: KP Singh <kpsingh@kernel.org>, Alexei Starovoitov <ast@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	John Fastabend <john.fastabend@gmail.com>,
	Andrii Nakryiko <andrii@kernel.org>,
	Martin KaFai Lau <martin.lau@linux.dev>,
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>,
	Yonghong Song <yonghong.song@linux.dev>,
	Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>,
	Jiri Olsa <jolsa@kernel.org>, Shuah Khan <shuah@kernel.org>,
	Jason Gunthorpe <jgg@ziepe.ca>, Saeed Mahameed <saeedm@nvidia.com>,
	Itay Avraham <itayavr@nvidia.com>,
	Dave Jiang <dave.jiang@intel.com>,
	Jonathan Cameron <Jonathan.Cameron@huawei.com>, bpf@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
	linux-rdma@vger.kernel.org, Chiara Meiohas <cmeiohas@nvidia.com>,
	Maher Sanalla <msanalla@nvidia.com>
Subject: Re: [PATCH v2 1/4] bpf: add firmware command validation hook
Message-ID: <aeChLBMdLW2AEHpR@google.com>
References: <20260331-fw-lsm-hook-v2-0-78504703df1f@nvidia.com>
 <20260331-fw-lsm-hook-v2-1-78504703df1f@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260331-fw-lsm-hook-v2-1-78504703df1f@nvidia.com>

On Tue, Mar 31, 2026 at 08:56:33AM +0300, Leon Romanovsky wrote:
> From: Chiara Meiohas <cmeiohas@nvidia.com>
> 
> Drivers communicate with device firmware either via register-based
> commands (writing parameters into device registers) or by passing
> a command buffer using shared-memory mechanisms.
> 
> The proposed fw_validate_cmd hook is intended for the command buffer
> mechanism, which is commonly used on modern, complex devices.
> 
> This hook allows inspecting firmware command buffers before they are
> sent to the device.
> The hook receives the command buffer, device, command class, and a
> class-specific id:
>   - class_id (enum fw_cmd_class) allows BPF programs to
>     differentiate between classes of firmware commands.
>     In this series, class_id distinguishes between commands from the
>     RDMA uverbs interface and from fwctl.
>   - id is a class-specific device identifier. For uverbs, id is the
>     RDMA driver identifier (enum rdma_driver_id). For fwctl, id is the
>     device type (enum fwctl_device_type).
> 
> The mailbox format varies across vendors and may even differ between
> firmware versions, so policy authors must be familiar with the
> specific device's mailbox format. BPF programs can be tailored to
> inspect the mailbox accordingly, making BPF the natural fit.
> Therefore, the hook is defined using the LSM_HOOK macro in bpf_lsm.c
> rather than in lsm_hook_defs.h, as it is a BPF-only hook.
> 
> Signed-off-by: Chiara Meiohas <cmeiohas@nvidia.com>
> Reviewed-by: Maher Sanalla <msanalla@nvidia.com>
> Signed-off-by: Leon Romanovsky <leonro@nvidia.com>
> ---
>  include/linux/bpf_lsm.h | 41 +++++++++++++++++++++++++++++++++++++++++
>  kernel/bpf/bpf_lsm.c    | 11 +++++++++++
>  2 files changed, 52 insertions(+)
> 
> diff --git a/include/linux/bpf_lsm.h b/include/linux/bpf_lsm.h
> index 643809cc78c33..7ad7e153f486c 100644
> --- a/include/linux/bpf_lsm.h
> +++ b/include/linux/bpf_lsm.h
> @@ -12,6 +12,21 @@
>  #include <linux/bpf_verifier.h>
>  #include <linux/lsm_hooks.h>
>  
> +struct device;
> +
> +/**
> + * enum fw_cmd_class - Class of the firmware command passed to
> + * bpf_lsm_fw_validate_cmd.
> + * This allows BPF programs to distinguish between different command classes.
> + *
> + * @FW_CMD_CLASS_UVERBS: Command originated from the RDMA uverbs interface
> + * @FW_CMD_CLASS_FWCTL: Command originated from the fwctl interface
> + */
> +enum fw_cmd_class {
> +	FW_CMD_CLASS_UVERBS,
> +	FW_CMD_CLASS_FWCTL,
> +};
> +
>  #ifdef CONFIG_BPF_LSM
>  
>  #define LSM_HOOK(RET, DEFAULT, NAME, ...) \
> @@ -53,6 +68,24 @@ int bpf_set_dentry_xattr_locked(struct dentry *dentry, const char *name__str,
>  int bpf_remove_dentry_xattr_locked(struct dentry *dentry, const char *name__str);
>  bool bpf_lsm_has_d_inode_locked(const struct bpf_prog *prog);
>  
> +/**
> + * bpf_lsm_fw_validate_cmd() - Validate a firmware command
> + * @in: pointer to the firmware command input buffer
> + * @in_len: length of the firmware command input buffer
> + * @dev: device associated with the command
> + * @class_id: class of the firmware command
> + * @id: device identifier, specific to the command @class_id
> + *
> + * Check permissions before sending a firmware command generated by
> + * userspace to the device.
> + *
> + * Return: Returns 0 if permission is granted, or a negative errno
> + * value to deny the operation.
> + */
> +int bpf_lsm_fw_validate_cmd(const void *in, size_t in_len,
> +			    const struct device *dev,
> +			    enum fw_cmd_class class_id, u32 id);
> +
>  #else /* !CONFIG_BPF_LSM */
>  
>  static inline bool bpf_lsm_is_sleepable_hook(u32 btf_id)
> @@ -104,6 +137,14 @@ static inline bool bpf_lsm_has_d_inode_locked(const struct bpf_prog *prog)
>  {
>  	return false;
>  }
> +
> +static inline int bpf_lsm_fw_validate_cmd(const void *in, size_t in_len,
> +					  const struct device *dev,
> +					  enum fw_cmd_class class_id, u32 id)
> +{
> +	return 0;
> +}
> +
>  #endif /* CONFIG_BPF_LSM */
>  
>  #endif /* _LINUX_BPF_LSM_H */
> diff --git a/kernel/bpf/bpf_lsm.c b/kernel/bpf/bpf_lsm.c
> index 0c4a0c8e6f703..fbdc056995fee 100644
> --- a/kernel/bpf/bpf_lsm.c
> +++ b/kernel/bpf/bpf_lsm.c
> @@ -28,12 +28,23 @@ __weak noinline RET bpf_lsm_##NAME(__VA_ARGS__)	\
>  }
>  
>  #include <linux/lsm_hook_defs.h>
> +
> +/*
> + * fw_validate_cmd is not in lsm_hook_defs.h because it is a BPF-only
> + * hook — mailbox formats are device-specific, making BPF the natural
> + * fit for inspection.
> + */
> +LSM_HOOK(int, 0, fw_validate_cmd, const void *in, size_t in_len,
> +	 const struct device *dev, enum fw_cmd_class class_id, u32 id)
> +EXPORT_SYMBOL_GPL(bpf_lsm_fw_validate_cmd);
> +

If you decide to stick w/ this BPF LSM based workaround, you can drop
the reliance on LSM_HOOK() entirely here.

>  #undef LSM_HOOK
>  
>  #define LSM_HOOK(RET, DEFAULT, NAME, ...) BTF_ID(func, bpf_lsm_##NAME)
>  BTF_SET_START(bpf_lsm_hooks)
>  #include <linux/lsm_hook_defs.h>
>  #undef LSM_HOOK
> +BTF_ID(func, bpf_lsm_fw_validate_cmd)
>  BTF_SET_END(bpf_lsm_hooks)
>  
>  BTF_SET_START(bpf_lsm_disabled_hooks)
> 
> -- 
> 2.53.0
> 
