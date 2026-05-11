Received: from mail-oo1-f50.google.com (mail-oo1-f50.google.com [209.85.161.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2246C358384
	for <linux-kselftest@vger.kernel.org>; Mon, 11 May 2026 16:53:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778518402; cv=none; b=UXvvcnN7xC3fU90V4G0F4xauo25EdCdrsEotXINhm964byVE4tmb5vKNeg50Y4MCwxKrf4f1loDZw3uqwF84Y3pN75Ef/eOroC7usU0pFz6TAVt9qHEYg13PHPKKpXIx5xphaCggCM2Ugks23uUYzxU1ITi0i+BOsapf4IP3FGE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778518402; c=relaxed/simple;
	bh=NDr89ZHqjMmSAUjSSYDe/cY3Eiu1jte8P7RxS6azPjU=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=W0Wk2zUCGM6m3b4zm0U2DqG6QZ6vHVVxCvkWjFrylfpLLzYC9UMinAh8J/Iqct/NidyCyMpYvLueGGWxJ556Dr7UERcyELXlLCIeyt+iysGHh7IfqVrNrqeVIkYCLXS8gwgAIH9/zx1QeHvOqFvsvGTEvV1y/TdzETboJecTb5k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ljDLeVW/; arc=none smtp.client-ip=209.85.161.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ljDLeVW/"
Received: by mail-oo1-f50.google.com with SMTP id 006d021491bc7-6966f99716fso2298014eaf.0
        for <linux-kselftest@vger.kernel.org>; Mon, 11 May 2026 09:53:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778518400; x=1779123200; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JavA89CInqrRT0axMkoFaX73nwP/5TwmJupoBxqRvFM=;
        b=ljDLeVW/UM0cgDttn8g3cTL06JrkMAr9PVMUHZx9PVOpYUxTGeS/Mi3jvg38dkJy45
         H+HsLHXM+MLVLybFkrw1EqYr53HcoUa3OEI9KsIbEeLB9EYzRGEuxMVzrTWaOGPVK6wu
         e69zT8HiyPrO1q6kPTejnZJ8gWq4SXVZeAvEoZCZbNsfMu2gC934/RPGwvaW2OjcREpC
         lOf1sujSjWYhwHEwz2JgzV1TeHIhCpCWUrFN2c8YljUpQtn8ABDCCut1FBnKr2i5SNTH
         +BnZuRBFDTtkFx876Q9gAMSHmjPi8YU+/IhwbMehVPyFsGOcLT0vRSIARBvS6MXqmWYZ
         oiLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778518400; x=1779123200;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=JavA89CInqrRT0axMkoFaX73nwP/5TwmJupoBxqRvFM=;
        b=IJKS++aThVbbsk3MeaxWN2To65J22MfKdHgvhZLEEwhncm1iyiBihn9w1AZZLx2VLz
         MlBoyN2Ewyrm8yJUpXxa+8aMzs6SoC8liO4CnG3sMbY5N1yHh0I/1MTTLDO0/AbOyPFk
         nKpPdj7QW321maMjiAfh3y5MutSmXzdHB2VhIIsz7dwgoCaCkcPF+2ScwiloEbtRkFPf
         KcD8k3EVh1aNr8z2t1JOgASVXDxsu/Sw9dNebJ6HzfZqCeYmnbl4tKdc/MBqCotodHD6
         wtduYjJQVWR/BI1oWJrwwPBGjtAlWBF5riOL5+1BskRYD+KdFXsjoKtQtNdHaFW8GJGp
         Tgtw==
X-Forwarded-Encrypted: i=1; AFNElJ8XxlpO233qjgdPLIW2h0M3rQS//HY55s245b8uStUQcu5xIvQM6rxezSmxPECZgl3qlxSb7BQZ6GpW31GT9fg=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywoi25/6wu4AhFNiDP5lOA7K08ZxE0TxrkKNaX3q0NKd34WS1MD
	07DBCCCSzMA0BkHIFdr/P7PTfPV9ndty7ZkKsajqwtfN5wO/PtY68A78
X-Gm-Gg: Acq92OFaiYpUVW24H4nfXl8Kj3xSPqNHuZOAu1zPvgGNFiSyRlWw5iO0Ol5H+9DO4GG
	EO65Pmqew6rR6UZYeNMbe05a1y8OSvXLICz/n+EFNtK8Sj7VtrZl6PrLxTBmp3Zb00mjk0UIWOO
	qWp6mAi6OjHJfqXkP90ex6jnxe8IJyxgiLXoOCQb5ffV72NeWIkXdPoD/3d93sSF1c5fh+QeuhW
	d62AHqnsb+2yRbiCG/1yUs2xVrFzeX++zoGvWj9UF6b5NlIMZSIzEVpSHzcIzUcLO5tb6LYTBLz
	rFu4l9UV/0wbzdd25JYV2PkxS3tReosgaY0kgEfmLq6mbi3NT682vdO/xeHB9n9uBsdmXR8485W
	3EVzE2XDHKIyvPCqC0fYGx4qOdDnL/K8v/lEU0y5WOeevjd2kzHS65g3xhJ2qTVaxA724Z9+xnb
	aEsyZZNLH3yaJtYbvSR5CmFJ/byG9Y9jf0SG/Dki/raF+srHKIn6dhygLlYvHtdGzStopPjhPXp
	hCLgoeEQk9XKVSvdaCN/4RboICX1eS1RZGS0GU=
X-Received: by 2002:a05:6820:986:b0:694:8b08:b916 with SMTP id 006d021491bc7-69b25c88aecmr8116691eaf.35.1778518399975;
        Mon, 11 May 2026 09:53:19 -0700 (PDT)
Received: from localhost ([2a03:2880:10ff:49::])
        by smtp.gmail.com with ESMTPSA id 006d021491bc7-69b25c75d08sm6137740eaf.4.2026.05.11.09.53.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 11 May 2026 09:53:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 11 May 2026 09:53:17 -0700
Message-Id: <DIG05KI4QZ2H.3JE4OWSK6KC29@gmail.com>
Cc: <ast@kernel.org>, <daniel@iogearbox.net>, <john.fastabend@gmail.com>,
 <andrii@kernel.org>, <martin.lau@linux.dev>, <eddyz87@gmail.com>,
 <song@kernel.org>, <yonghong.song@linux.dev>, <kpsingh@kernel.org>,
 <sdf@fomichev.me>, <haoluo@google.com>, <jolsa@kernel.org>,
 <shuah@kernel.org>, <brauner@kernel.org>, <sforshee@kernel.org>,
 <yuichtsu@amazon.com>, <aalbersh@redhat.com>, <willemb@google.com>,
 <kerneljasonxing@gmail.com>, <chen.dylane@linux.dev>, <yatsenko@meta.com>,
 <memxor@gmail.com>, <a.s.protopopov@gmail.com>, <ameryhung@gmail.com>,
 <rongtao@cestc.cn>, <linux-kernel@vger.kernel.org>,
 <linux-api@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <kernel-patches-bot@fb.com>, <martin.lau@kernel.org>, <clm@meta.com>,
 <ihor.solodrai@linux.dev>
Subject: Re: [PATCH bpf-next v13 1/8] bpf: Extend BPF syscall with common
 attributes support
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: <bot+bpf-ci@kernel.org>, <leon.hwang@linux.dev>, <bpf@vger.kernel.org>
X-Mailer: aerc
References: <20260511152817.89191-2-leon.hwang@linux.dev>
 <810f123d14450d09d147d90dea25ddf5091e636542fcc5729d0594bfbd622757@mail.kernel.org>
In-Reply-To: <810f123d14450d09d147d90dea25ddf5091e636542fcc5729d0594bfbd622757@mail.kernel.org>

On Mon May 11, 2026 at 9:19 AM PDT, bot+bpf-ci wrote:
>> diff --git a/include/linux/syscalls.h b/include/linux/syscalls.h
>> index f5639d5ac331..50055ab73649 100644
>> --- a/include/linux/syscalls.h
>> +++ b/include/linux/syscalls.h
>> @@ -936,7 +936,8 @@ asmlinkage long sys_seccomp(unsigned int op, unsigne=
d int flags,
>>  asmlinkage long sys_getrandom(char __user *buf, size_t count,
>>  			      unsigned int flags);
>>  asmlinkage long sys_memfd_create(const char __user *uname_ptr, unsigned=
 int flags);
>> -asmlinkage long sys_bpf(int cmd, union bpf_attr __user *attr, unsigned =
int size);
>> +asmlinkage long sys_bpf(int cmd, union bpf_attr __user *attr, unsigned =
int size,
>> +			struct bpf_common_attr __user *attr_common, unsigned int size_common=
);
>>  asmlinkage long sys_execveat(int dfd, const char __user *filename,
>>  			const char __user *const __user *argv,
>>  			const char __user *const __user *envp, int flags);
>
> [ ... ]
>
>> diff --git a/tools/include/uapi/linux/bpf.h b/tools/include/uapi/linux/b=
pf.h
>> index 677be9a47347..16ff0968fc21 100644
>> --- a/tools/include/uapi/linux/bpf.h
>> +++ b/tools/include/uapi/linux/bpf.h
>> @@ -994,6 +994,7 @@ enum bpf_cmd {
>>  	BPF_PROG_STREAM_READ_BY_FD,
>>  	BPF_PROG_ASSOC_STRUCT_OPS,
>>  	__MAX_BPF_CMD,
>> +	BPF_COMMON_ATTRS =3D 1 << 16, /* Indicate carrying syscall common attr=
s. */
>>  };
>
> [ ... ]
>
>> @@ -1500,6 +1501,13 @@ struct bpf_stack_build_id {
>>  	};
>>  };
>>
>> +struct bpf_common_attr {
>> +	__u64 log_buf;
>> +	__u32 log_size;
>> +	__u32 log_level;
>> +	__u32 log_true_size;
>> +};
>> +
>
> Should log_buf use __aligned_u64 instead of plain __u64?
>
> Looking at other pointer-bearing fields in the BPF UAPI, they consistentl=
y
> use __aligned_u64. For example, the existing BPF_PROG_LOAD log_buf in uni=
on
> bpf_attr is declared as:
>
>     __aligned_u64 log_buf;  /* user supplied buffer */
>
> The __aligned_u64 attribute forces 8-byte alignment on all architectures,
> including 32-bit systems where native unsigned long long alignment is onl=
y
> 4 bytes. Without this attribute, struct bpf_common_attr will have differe=
nt
> layouts between 32-bit and 64-bit ABIs:
>
> - 32-bit: 20 bytes, 4-byte aligned
> - 64-bit: 24 bytes (4 bytes of tail padding), 8-byte aligned
>
> While the current __sys_bpf() implementation with bpf_check_uarg_tail_zer=
o()
> and min_t() capped copying handles this gracefully, deviating from the
> established BPF UAPI convention could create problems for future extensio=
ns.
> If another __u64 field is added later, the inter-field offsets would dive=
rge
> between ABIs.
>
> Would it be better to use __aligned_u64 log_buf to match union bpf_attr a=
nd
> preserve identical struct layouts across 32/64-bit ABIs?

bot has a point.

pw-bot: cr
