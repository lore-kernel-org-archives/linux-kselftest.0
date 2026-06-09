Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE567495528
	for <linux-kselftest@vger.kernel.org>; Tue,  9 Jun 2026 18:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781029314; cv=none; b=KvU3R9y14io4WU8JrxhtmajUUJ4eHNcsN9gpS8tiUsGhpCH7vP16D2ubafPRYATxLkDb5SDo5Kl7CcL4GZFh/BnAo+t0HcpoGq83M6rWYGS1AxQToFtiSZYrHkhAJ1BQUblk7uq9l2f8qKjr5POBhP0mGIOG0bp28ViX2cVZtBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781029314; c=relaxed/simple;
	bh=Pj5qSOkBbQLxrzD3/c2ksrSEnkBsZlcOQdL+gxq6HnM=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:Cc:Subject:From:
	 References:In-Reply-To; b=jQSgLh4RnzOCBesww4ov/cS+uSEyYrhlFiCYVefoFQTeHs7Vse5L98MyJiq35cArWz4IdX2fBzBysAHgotjwkUdpvYAkUQ7MwodnKWfgYjqTKrtYLqh+b/WedsHHC64Z9Fbo5xqZdoIREAe8OgMQOQglsY8E3UgxfbIQKwVu/ac=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com; spf=pass smtp.mailfrom=etsalapatis.com; dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b=vS/YJGpq; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b="vS/YJGpq"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-307d0405e07so1545448eec.1
        for <linux-kselftest@vger.kernel.org>; Tue, 09 Jun 2026 11:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=etsalapatis-com.20251104.gappssmtp.com; s=20251104; t=1781029312; x=1781634112; darn=vger.kernel.org;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sI7a7X7zVj9lSZe9s9onuQtmD1DDrDFRkHXe/vB2iho=;
        b=vS/YJGpqy0GyKoGzzrEQSApPikWTgr1VUpOjFyZ331FNTWQ0z6ce1FtOxeVVz0Bj0z
         XJsgmpFbYcGGZOSFFg5TjKtigd3vNM2wfaJ3HDr4INpK2hYZqZBZ2nl+N40MDiIXpVGk
         7WgIfp0RvYWWoRFj1Ii5NabkwCj7njQd3OO7/p+wiB1KoqxRBlA3PHShfzjYWUnclqHV
         we1E5Bt0MJg1mKemTdGz/VHxl8kQ9f9aJTMLPJ+KmHehU5j4ykXv7hdXtgroojHxy59o
         D8aev+zNWUSSW3Gcc6QE49SJ5erft0gwKfX1jmlEHB66qajP8sH3+1ZotiBJksJK+iyL
         AJhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781029312; x=1781634112;
        h=in-reply-to:references:from:subject:cc:to:message-id:date
         :content-transfer-encoding:mime-version:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=sI7a7X7zVj9lSZe9s9onuQtmD1DDrDFRkHXe/vB2iho=;
        b=DTtBn8lqETjnVsz+JSGJdGHHivpnk/o/XfyznCXamzqTNa/jAbLhSyBytpyN8TfccH
         Py6rh5bVY+pRhSG0Acq4nEHOHCHq2exnFLZnPjWYBpBUonzHYNAGKnvTztq+O+IllYVu
         3bC9d8EdClxRhtubEkQ3oCWpxqQM3RKoOWQ20WZvbVq0Tiyq9J741k8psJMuJUx72BTP
         1P27SbaHl5suVS+QwwRCrqJViLh5Uyb9OrL4LG5DaI3OnA89O/x92SGecZjw1Cff9vpg
         f3RztYf7nxXoePyADBGxI+o5nElzSmYEPq45qzC+0vxrdfK/axSss5JNemZMX+dD8DIL
         WRDg==
X-Forwarded-Encrypted: i=1; AFNElJ+Zq1FhJU7Ix/ojPbcRRsfVSD3M68OHj3gBB1aNS92LLjt1qryZt8m5/khDtz7LigE9bzsiY/6anHxJaHaAfC4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx83VqWSZLBWb0F2cvjyExpQ08ifcrLI3GSGiuxRpwjSZkmbsEe
	RoOqfhBgH8roc13vgFHmVUPxfM7KQDm7h7lUpS+gYtxf9H1jg6QTxO8j3U4PcF8K9HY=
X-Gm-Gg: Acq92OGw0iQBWCupX2tJXqz335W2vdeqB+XzEPX7V5EwaW7Kj3GOYd0fEGTKk+J21If
	U7WbK462yWYWkYE4XIOrqUhH/HXI2qED1vrzXOuycmLp2uXDs5uUjv3s6fcEIfizP92tjibBUpx
	85XeQNwqidbSqDYiX4REoonVOwIpFAMPkXAIibzGdFOXAkGK/9FMqWo19SlomZmvBJoh00+5IX1
	2ckKDOrtLpBNcWbmauW3B0mAm/sTPGJBJEuRxs+a1NMzPqZ2NW/0gPb/K+U/V90GuMToQh1AOlu
	VBPpPTPVNnCPMTioRIQYcg6ZdBHV+ii6CmxCbQeDHSb9ZN6HDa5cxjEgCpyloTd8DSxWt9aTDAy
	W8aM0nR0enZRZH90FTwmwa8MAhcXieiFG13/af8/oCnfvkLffGua2w2U8O1mNcUW5d4FYbPqGC9
	Uw+Lep3wVH8uQWpcD2+0vK7JupAA==
X-Received: by 2002:a05:7300:2321:b0:307:393a:8f1d with SMTP id 5a478bee46e88-3077b0a4d7emr13442792eec.14.1781029311901;
        Tue, 09 Jun 2026 11:21:51 -0700 (PDT)
Received: from localhost ([2620:10d:c090:600::3297])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074df102a1sm20976948eec.20.2026.06.09.11.21.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Jun 2026 11:21:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Tue, 09 Jun 2026 14:21:49 -0400
Message-Id: <DJ4Q75GQJ6MW.2TNULY7BLDWA0@etsalapatis.com>
To: "Eduard Zingerman" <eddyz87@gmail.com>, "Nuoqi Gui"
 <gnq25@mails.tsinghua.edu.cn>, "Alexei Starovoitov" <ast@kernel.org>,
 "Daniel Borkmann" <daniel@iogearbox.net>, "Andrii Nakryiko"
 <andrii@kernel.org>
Cc: "Kumar Kartikeya Dwivedi" <memxor@gmail.com>, "John Fastabend"
 <john.fastabend@gmail.com>, "Martin KaFai Lau" <martin.lau@linux.dev>,
 "Song Liu" <song@kernel.org>, "Yonghong Song" <yonghong.song@linux.dev>,
 "Jiri Olsa" <jolsa@kernel.org>, "Shuah Khan" <shuah@kernel.org>,
 <bpf@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>
Subject: Re: [PATCH bpf-next 1/2] bpf: Reject scalar addition from untrusted
 memory
From: "Emil Tsalapatis" <emil@etsalapatis.com>
X-Mailer: aerc 0.21.0-0-g5549850facc2
References: <20260609-f01-03-scalar-add-bpf-next-v1-0-e6212e274155@mails.tsinghua.edu.cn> <20260609-f01-03-scalar-add-bpf-next-v1-1-e6212e274155@mails.tsinghua.edu.cn> <c6cf40ef2957b6b2acf8820bce10becda20d9dfd.camel@gmail.com>
In-Reply-To: <c6cf40ef2957b6b2acf8820bce10becda20d9dfd.camel@gmail.com>

On Tue Jun 9, 2026 at 1:01 PM EDT, Eduard Zingerman wrote:
> On Tue, 2026-06-09 at 22:55 +0800, Nuoqi Gui wrote:
>> scalar +=3D rdonly_untrusted_mem reaches adjust_ptr_min_max_vals() with =
the
>> pointer as the source register. The untrusted PTR_TO_MEM case returns th=
ere
>> without updating the scalar destination, leaving stale verifier state.
>>=20
>> Reject that addition before the early return. Pointer +=3D scalar remain=
s
>> handled by the existing untrusted-memory rule.
>>=20
>> Fixes: f2362a57aeff ("bpf: allow void* cast using bpf_rdonly_cast()")
>> Signed-off-by: Nuoqi Gui <gnq25@mails.tsinghua.edu.cn>
>> ---
>>  kernel/bpf/verifier.c | 8 ++++++++
>>  1 file changed, 8 insertions(+)
>>=20
>> diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
>> index c8d980fdd709..c6b350f9585a 100644
>> --- a/kernel/bpf/verifier.c
>> +++ b/kernel/bpf/verifier.c
>> @@ -14823,6 +14823,14 @@ static int adjust_reg_min_max_vals(struct bpf_v=
erifier_env *env,
>>  				 * This is legal, but we have to reverse our
>>  				 * src/dest handling in computing the range
>>  				 */
>> +				if (opcode =3D=3D BPF_ADD &&
>> +				    base_type(src_reg->type) =3D=3D PTR_TO_MEM &&
>> +				    (src_reg->type & PTR_UNTRUSTED)) {
>> +					verbose(env, "R%d tried to add from %s to scalar\n",
>> +						insn->dst_reg,
>> +						reg_type_str(env, src_reg->type));
>> +					return -EACCES;
>> +				}
>>  				err =3D mark_chain_precision(env, insn->dst_reg);
>>  				if (err)
>>  					return err;
>
> Should the fix be like this:
>
>   diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
>   index 7d27ba396d32..9c85dd680a46 100644
>   --- a/kernel/bpf/verifier.c
>   +++ b/kernel/bpf/verifier.c
>   @@ -13593,8 +13593,10 @@ static int adjust_ptr_min_max_vals(struct bpf_=
verifier_env *env,
>            * Accesses to untrusted PTR_TO_MEM are done through probe
>            * instructions, hence no need to track offsets.
>            */
>   -       if (base_type(ptr_reg->type) =3D=3D PTR_TO_MEM && (ptr_reg->typ=
e & PTR_UNTRUSTED))
>   +       if (base_type(ptr_reg->type) =3D=3D PTR_TO_MEM && (ptr_reg->typ=
e & PTR_UNTRUSTED)) {
>   +               *dst_reg =3D *ptr_reg;
>                   return 0;
>   +       }
>   =20
>           switch (base_type(ptr_reg->type)) {
>           case PTR_TO_CTX:
>
> Instead?

Seconded, AFAICT there is no reason to fail verification since we just
the pointer's value to the scalar. Whether the operation makes sense is
up to the programmer to decide.

