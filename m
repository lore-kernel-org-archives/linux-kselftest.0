Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 283F14307BC
	for <linux-kselftest@vger.kernel.org>; Mon, 20 Jul 2026 22:55:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784588112; cv=none; b=B5GjP3nvZGNhTCy3LIW3tfHkWrFamCdNMuNXPQw99tEFGQyqjFqh24yJGH8jqTZTVi/bVQPrcU0hRzZRaXbOfpvkrcqdfXKMTqufnkQh2u7P/VEvb8kwbEA260s5npM7dguTpitmTERLJyPjyS+4fQbrh+e2VaL+bOtmZr9LXyk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784588112; c=relaxed/simple;
	bh=DuwoLoocC5KEX4fom5jop9xjwLbH6dmrbqe3Lwe8Igc=;
	h=Mime-Version:Content-Type:Date:Message-Id:Cc:Subject:From:To:
	 References:In-Reply-To; b=HXzVc106j582OBn6isxlvzb0z7D7bYBMxH4jcrj7e3WSxE+vXkM2kP8ZaypKMHDwMVXKadsxMZNLR9jLIrPDMLWBvgUBIgFfChIKTemMQl/oKI1b+smBW6WAgIlBbr4nkF5Qs5p64eezOV7QxAqAP280yuQBkG4AR3tLy3AnQoA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com; spf=pass smtp.mailfrom=etsalapatis.com; dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b=MeYCBhn3; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=etsalapatis.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=etsalapatis-com.20251104.gappssmtp.com header.i=@etsalapatis-com.20251104.gappssmtp.com header.b="MeYCBhn3"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2cacb8416a1so72317025ad.1
        for <linux-kselftest@vger.kernel.org>; Mon, 20 Jul 2026 15:55:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=etsalapatis-com.20251104.gappssmtp.com; s=20251104; t=1784588110; x=1785192910; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uiDaTietAlrtPBtFFJF3jlwUkPb84yeQywUkW/obk08=;
        b=MeYCBhn3z8r2zZnNNpMtFN8jwxMJgZoK2q03bdM2zm+xtw+GRmXM+dtN6+FHnsEw1h
         2Phon3J65IeWL4/o3KIdMkepuhKj7IbmtVaJiv5LGpBMiBP0isdkNQ6AkzWBwYzIetzp
         YWgxjfdfqQ3+1zj0vanaO8GcChOVg6QMoNlURy9ukNa8n3L77onKMvQsES82sy+nUrEI
         ++TJDRdScuEs9rhFHLIUaW6JWYAAgzPd6Lo9KTJ59UqdTqoF3z+7TU6s1hjiqCHazYVp
         8WT8tbnGKify/CB6Dc6q/rjh3l3ToJibkhTCfWzGDqnSKGoA8x5P7WVuC+WxNrcihuh9
         D3iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784588110; x=1785192910;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uiDaTietAlrtPBtFFJF3jlwUkPb84yeQywUkW/obk08=;
        b=f7uxcO0zwXDW7L3w0fCgPw7kFVyNytU62UlrqUYoFsOXXuZ+nISd49u20v3psHo4ma
         hXe7gYEDGpg1o7jjgLORmnS12vNl5+VaS9YLVbCy8T38nwxlKUE3T/D9XR2Emc7yodtv
         pFt9Sc8WGce0mrIAg8CvBlIjxd6MEep0JHpLenERyVIk4Sr8u4Yax/7fAwFECMlEmPjW
         8XUAYaXO5xK9R20tjFpfdWTERwrCP3H/INz1FbRSpDX72EWmWPXFaQE6PYYPQ6xSbIRz
         IY0sW18KLvDjtUwgflIfl/iOBWzVfUobkxMAz69/6vizoESidqdo0KiZVoBb0nPfjLQQ
         2cKg==
X-Forwarded-Encrypted: i=1; AHgh+RrJe+T8eKC2C+WVAEEMAykpl6+xysfjT5WikExjTUJoqdcHo1bdt0HTVrCy4DWk+1gO1RK0JxNUTD/4Fti7Fk8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxozhELWmnedvHeQvlhaFdVWeHAHkZD/gFoqU4GMb2uxzDc6qfA
	QClmDHSZVWtaS/TZMEu8XlYssRna+NtlGHJhtL7TGvCcMidSIEnTC9JVjpy/eIivsyc=
X-Gm-Gg: AR+sD10OJE+9Dkh9EzwPitOxGYVBpHvB6hEAvhyen3opQW7LKNEqaO675nd4jTwyj39
	XQB7KD6JmLnIdLTtJGkJia5l1g45+elzM1WH9QIWvsC0wwNNPXrJa5O3bTrKdQbvu7R94OzKg3i
	jUf43mZGgopCbJ6mrNrkWv89NKTiiHqxQOCWi+zpa1x7Yz7as8JOdie2wVGxRU5z+giITyCj/TN
	STpeEAQfTp0Ll9BxhuMTKJYLcRB+1uVm3YZEmoDvWBBc80NBrtVlb76Jm3a91wo/m3fhmpODHqE
	qkrhWcb/wPjj9g1avq0I4n77/FhXcXCOeip87lVsnz6IEpvOuUdRFvQtfqjK3rYKW7v9q9FE8A7
	11wtWNSVmEpP1lH1oDVJcHE98OfKYaw8E0cRSfHV+Mi5ZVZeqtNjFq5vkRPi5qvWshyc2RogFYT
	ob3Pwt0tcihINb5hcM9K3qZ4TluylNihTk9e4qbYXVyw==
X-Received: by 2002:a17:903:3c46:b0:2ca:b48f:3395 with SMTP id d9443c01a7336-2cf349b8496mr167528205ad.34.1784588110210;
        Mon, 20 Jul 2026 15:55:10 -0700 (PDT)
Received: from localhost (107-190-31-17.cpe.teksavvy.com. [107.190.31.17])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3479463bsm62613395ad.80.2026.07.20.15.55.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 20 Jul 2026 15:55:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 20 Jul 2026 18:55:08 -0400
Message-Id: <DK3ROR4KKIIT.1RCEKYHY63CPT@etsalapatis.com>
Cc: "Alexei Starovoitov" <ast@kernel.org>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "Andrii Nakryiko" <andrii@kernel.org>, "Martin
 KaFai Lau" <martin.lau@linux.dev>, "Eduard Zingerman" <eddyz87@gmail.com>,
 "Kumar Kartikeya Dwivedi" <memxor@gmail.com>, "Song Liu" <song@kernel.org>,
 "Yonghong Song" <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>,
 "John Fastabend" <john.fastabend@gmail.com>, "Quentin Monnet"
 <qmo@kernel.org>, "Shuah Khan" <shuah@kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <kernel-patches-bot@fb.com>
Subject: Re: [PATCH bpf-next v10 2/9] bpf: Introduce global percpu data
From: "Emil Tsalapatis" <emil@etsalapatis.com>
To: "Leon Hwang" <leon.hwang@linux.dev>, <bpf@vger.kernel.org>
X-Mailer: aerc 0.20.1
References: <20260715153254.92010-1-leon.hwang@linux.dev>
 <20260715153254.92010-3-leon.hwang@linux.dev>
 <DK0MRMWIAE1T.20UJQKK2YN3VY@etsalapatis.com>
 <9615cf9b-4a77-4d7a-aec4-8990ea6ff638@linux.dev>
In-Reply-To: <9615cf9b-4a77-4d7a-aec4-8990ea6ff638@linux.dev>

On Mon Jul 20, 2026 at 12:59 AM EDT, Leon Hwang wrote:
> On 17/7/26 14:25, Emil Tsalapatis wrote:
>> On Wed Jul 15, 2026 at 11:32 AM EDT, Leon Hwang wrote:
>
> [...]
>
>>> =20
>>> +static int percpu_array_map_direct_value_addr(const struct bpf_map *ma=
p, u64 *imm, u32 off)
>>> +{
>>> +	struct bpf_array *array =3D container_of(map, struct bpf_array, map);
>>> +
>>> +	if (map->max_entries !=3D 1)
>>> +		return -EOPNOTSUPP;
>>> +	if (off >=3D map->value_size)
>>> +		return -EINVAL;
>>> +	if (!bpf_jit_supports_percpu_insn())
>>> +		return -EOPNOTSUPP;
>>=20
>> Nit: This should be first, if the JIT doesn't support the instruction
>> all else is moot. Same below.
>
> Ack.
>
>>=20
>>> +
>>> +	*imm =3D (u64)(__force unsigned long) array->pptrs[0];
>>> +	return 0;
>>> +}
>>> +
>>> +static int percpu_array_map_direct_value_meta(const struct bpf_map *ma=
p, u64 imm, u32 *off)
>>> +{
>>> +	struct bpf_array *array =3D container_of(map, struct bpf_array, map);
>>> +	u64 base =3D (u64)(__force unsigned long) array->pptrs[0];
>>> +
>>> +	if (map->max_entries !=3D 1)
>>> +		return -EOPNOTSUPP;
>>> +	if (imm < base || imm >=3D base + array->elem_size)
>>> +		return -ENOENT;
>>> +	if (!bpf_jit_supports_percpu_insn())
>>> +		return -EOPNOTSUPP;
>>> +
>>> +	*off =3D imm - base;
>>> +	return 0;
>>> +}
>>> +
>
> [...]
>
>>> diff --git a/kernel/bpf/verifier.c b/kernel/bpf/verifier.c
>>> index e1244a721194..ae442ea217c4 100644
>>> --- a/kernel/bpf/verifier.c
>>> +++ b/kernel/bpf/verifier.c
>>> @@ -5615,6 +5615,8 @@ int bpf_map_direct_read(struct bpf_map *map, int =
off, int size, u64 *val,
>>>  	u64 addr;
>>>  	int err;
>>> =20
>>> +	if (map->map_type =3D=3D BPF_MAP_TYPE_INSN_ARRAY || map->map_type =3D=
=3D BPF_MAP_TYPE_PERCPU_ARRAY)
>>> +		return -EINVAL;
>>>  	err =3D map->ops->map_direct_value_addr(map, &addr, off);
>>>  	if (err)
>>>  		return err;
>>> @@ -6174,6 +6176,7 @@ static int check_mem_access(struct bpf_verifier_e=
nv *env, int insn_idx, struct b
>>>  			if (tnum_is_const(reg->var_off) &&
>>>  			    bpf_map_is_rdonly(map) &&
>>>  			    map->ops->map_direct_value_addr &&
>>> +			    map->map_type !=3D BPF_MAP_TYPE_PERCPU_ARRAY &&
>>>  			    map->map_type !=3D BPF_MAP_TYPE_INSN_ARRAY) {
>>=20
>> An issue I have with the patch is that it takes the special-casing we
>> already have for INSN_ARRAY and makes it worse. The instruction arrays
>> implement direct_value_addr, but it's not actually valid to call
>> direct_value_addr from a bunch of places where it's called, so we have
>> to special case check the map type to prevent it. Case in point the
>> special casing in check_arg_const_str in the thunk below.
>>=20
>> Imo we should consider making a different map method different from
>> direct_value_addr that INSN_ARRAY and PERCPU_ARRAY implement. That way
>> we remove most of the map type checks in those paths. I'm not exactly
>> sure how that would look like, but I could take a look at it tomorrow.
>
>
> Seems reasonable to me. I don't have good candidates for the new map
> method name.
>
> Instead of making a new map method, how about factoring out a helper for
> the 'if (t =3D=3D BPF_READ && value_regno >=3D 0) {}' block? It will simp=
lify
> these map_type checks in the helper.
>

[...]

>>=20
>>>  				int map_off =3D off + reg->var_off.value;
>>>  				u64 val =3D 0;
>>> @@ -8176,6 +8179,12 @@ static int check_arg_const_str(struct bpf_verifi=
er_env *env,
>>>  		return -EACCES;
>>>  	}
>>> =20
>>> +	if (map->map_type =3D=3D BPF_MAP_TYPE_PERCPU_ARRAY) {
>>> +		verbose(env, "%s points to percpu_array map which cannot be used as =
const string\n",
>>> +			reg_arg_name(env, argno));
>>> +		return -EACCES;
>>> +	}
>>> +
>>>  	if (!bpf_map_is_rdonly(map)) {
>>>  		verbose(env, "%s does not point to a readonly map'\n", reg_arg_name(=
env, argno));
>>>  		return -EACCES;
>>> @@ -18279,6 +18288,12 @@ static int check_and_resolve_insns(struct bpf_=
verifier_env *env)
>>>  					return -EINVAL;
>>>  				}
>>> =20
>>> +				if (map->map_type =3D=3D BPF_MAP_TYPE_PERCPU_ARRAY &&
>>> +				    !env->prog->jit_requested) {
>>> +					verbose(env, "JIT is required to use global percpu data\n");
>>> +					return -EOPNOTSUPP;
>>> +				}
>>> +
>>=20
>> Another place where we add map-specific checks where there are none.
>
>
> I think this check is unnecessary, because 'prog->jit_required =3D true'
> has been set for global percpu data.
>
> Will drop this if.

I think you're right, in which case we can drop it. In turn this means
wrapping the check above in a helper adds enough structure to the logic.
Adding the new method would still work valid but it'd be more borderline
in terms of simplifying the code because we''ll have abstracted most of
the type checks away.

>
> Thanks,
> Leon
>
>>=20
>>>  				err =3D map->ops->map_direct_value_addr(map, &addr, off);
>>>  				if (err) {
>>>  					verbose(env, "invalid access to map value pointer, value_size=3D%=
u off=3D%u\n",
>>=20

