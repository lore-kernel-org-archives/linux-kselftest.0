Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AEBC38A70B
	for <linux-kselftest@vger.kernel.org>; Wed, 13 May 2026 22:33:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778711582; cv=none; b=AorMiMXjpWw+vN34AFSXX045F8a2ZsDNnBV0z1kBJuOzCe1Lwo9svK3rdXLMGn8r2c1QCmSCjqtqcZzqjTBHUBF85SyYOJcx7/iRON9SDhbpe7qDQmnGRF8RwMUopkGZ3aztSXEhmusqc4wPPjWpo7+YYVyDvDzXyg00h2HGUYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778711582; c=relaxed/simple;
	bh=/i4iQVVYgZcyZkahqB/Yq4izkN3VKOXSgDTz3AsYNTA=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=fMzrqcqa6mJMGY+LPEFGQ7IJcctfMg8fSvPKzIIhUxi58viIL0b8vvm6zz6AzOqF0KCeTZLWN1B+OdDwEIV5OeWZmOFejk8tSbTQeDpxRPUUAvhJmAXNKzHwrREBmbaJB2rK7SulmQKhwDkyI50NT7XXYQQT6ePfjXAIXEF3Umo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D7WQ2Zns; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D7WQ2Zns"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2f36da5c8fbso7258476eec.0
        for <linux-kselftest@vger.kernel.org>; Wed, 13 May 2026 15:33:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778711580; x=1779316380; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uSoqkJU8a2VQZhervRKHGXNqeNUvIdC6OMh7SCfL6fk=;
        b=D7WQ2ZnsIVpUZ5yfP4dzrtkImYWkjU7xeCJZva4XgAt4pQmhJzWKHWXDDTK0F78mgl
         w3limhtQyrpjuOHpNLmj0wWhI67/0LNVn6oTlmKu3ArZ5yrnAp3112wR2wPpt//p0KxE
         bjaCRFicA8WoD0YPXQgN5dkNzf9JDYGxqd7ToxR5iVp6uFC3bFiVEK4Gor1oFYVnxLwo
         fBcR0pcyL2EdxTcR3OmILng3wJWzURBsJkah6POuuKjbiJZpdZ0ZoEI66Kyrem2MGmC1
         jW9B9uIpd3O9Wyd8d4tHH/J2Z0cM318cPhJo/j7v7teXtVHg9lNccgZq0D/3Unxf9Ihk
         l7jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778711580; x=1779316380;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uSoqkJU8a2VQZhervRKHGXNqeNUvIdC6OMh7SCfL6fk=;
        b=FZ+ePSv8O2ja4xRxYJ4N3l7sBoYJltiRSbs6RGeYGdfYlx/XOAvcEfjXsZgcK0bZDV
         tatW3XBysTB0exvExUwB7HbaqmTgmFIQW3QD2Z9Q3Po0vMNn9CfTAi10hDlp7CvmLaFP
         uq7JPL6iZhqVBE1ZGfGM31Xp7KvZxDvQLzzuzvrZDGTLuZrLo/HiHtqcAQBa7Sgze+ZA
         KscP2KzEk/GIK0jb3EE1oUsK11VrrEJkPjCFOdG4vNd3SycHvooyhdJGlu+lfxBiQtbt
         FhtrkqqqaS9tZo0P/s0M8CIWzEK8dBbq2MqMAcZBlf5xa5I0IDkjN7BuG+eGKcjQ+VZ2
         t3pA==
X-Forwarded-Encrypted: i=1; AFNElJ//v+xzA0b6QfMhSKhgsxGOHwQn/+R6Aen2eyZeVZPH4C5ZFYCbVaz2RJ5kJH5XhDmvunO2iizCmLm8ecq4HYE=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyt0Q9ST76undK2JXntbeH6TcTrg7ZQk+1V0vPGAcIIXFFitwv6
	dwASk3btmWbmYX20lD/kf1XjP9ccK0DTYYFN8tLKtqBiHzB4WrFJ6zwp
X-Gm-Gg: Acq92OF8dnseJaSR31u0JFm3rhzl2SnkYdMowPevn29adqQuhQ+drUbfK0t53l/aLXK
	mtac0PcRPFQ2R+Zolxx5SKhSypLUG0s5R6i20V+pbakpej62mkh75V0EA74XNUmtUtpYnE6OyVK
	r97btK6v1FNc555H0FMPQGVA/Igw9zLb8ZrAg5NVod0LtMRXG/UUjNgRIzBU9y8+TFosoHVuM7v
	kevgSZjpdDhUICwtkF8O+kdjT8xTILAKGSeuHbrScwhGtqOC+m2Dup4ynFaCMdnem5ylZxbyUhO
	sIRiWnJk79D/ErkywqASAn6U//eLN6eXQt11EoFfHIxFD08hqb+qbM7grjGz5LP7O9w8TvXhurR
	J+NeHjIbvQ/VUbhPlriaBY3YT37lzbcKH2LUot8X9+9cK0KGJJOH9CGku6vno75ybLgwbPvFQ98
	9az3aqti4vlIMb3Vb11eBdBl7LNKjXXGGNwFxZjN2o2raGeo7yvhH9m0eeThiRdM3ucLiSdyh/L
	y49oV8=
X-Received: by 2002:a05:7301:1011:b0:2be:833c:149d with SMTP id 5a478bee46e88-30119f71457mr2928472eec.28.1778711580223;
        Wed, 13 May 2026 15:33:00 -0700 (PDT)
Received: from ?IPv6:2a03:83e0:115c:1:5152:641f:f5ef:6c7b? ([2620:10d:c090:500::2:8a9])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30294adddaasm761840eec.13.2026.05.13.15.32.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 13 May 2026 15:32:59 -0700 (PDT)
Message-ID: <ca14a6fd8a1f3ce1e64c70b6d9ea2baf8df913ae.camel@gmail.com>
Subject: Re: [PATCH RESEND bpf-next v10 3/8] bpf: Introduce the bpf_list_del
 kfunc.
From: Eduard Zingerman <eddyz87@gmail.com>
To: Kaitao cheng <kaitao.cheng@linux.dev>, ast@kernel.org, corbet@lwn.net, 
	martin.lau@linux.dev, daniel@iogearbox.net, andrii@kernel.org,
 song@kernel.org, 	yonghong.song@linux.dev, john.fastabend@gmail.com,
 kpsingh@kernel.org, 	sdf@fomichev.me, haoluo@google.com, jolsa@kernel.org,
 shuah@kernel.org, 	chengkaitao@kylinos.cn, skhan@linuxfoundation.org,
 memxor@gmail.com
Cc: bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, vmalik@redhat.com,
 linux-kselftest@vger.kernel.org
Date: Wed, 13 May 2026 15:32:57 -0700
In-Reply-To: <20260512055919.95716-4-kaitao.cheng@linux.dev>
References: <20260512055919.95716-1-kaitao.cheng@linux.dev>
	 <20260512055919.95716-4-kaitao.cheng@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2026-05-12 at 13:59 +0800, Kaitao cheng wrote:
> From: Kaitao Cheng <chengkaitao@kylinos.cn>
>=20
> Allow users to remove any node from a linked list.
>=20
> We have added an additional parameter bpf_list_head *head to
> bpf_list_del, as the verifier requires the head parameter to
> check whether the lock is being held.
>=20
> Signed-off-by: Kaitao Cheng <chengkaitao@kylinos.cn>
> ---

Reviewed-by: Eduard Zingerman <eddyz87@gmail.com>

[...]

> @@ -11456,7 +11459,8 @@ static bool check_kfunc_is_graph_node_api(struct =
bpf_verifier_env *env,
> =20
>  	switch (node_field_type) {
>  	case BPF_LIST_NODE:
> -		ret =3D is_bpf_list_push_kfunc(kfunc_btf_id);
> +		ret =3D is_bpf_list_push_kfunc(kfunc_btf_id) ||
> +		      kfunc_btf_id =3D=3D special_kfunc_list[KF_bpf_list_del];

Nit: to keep everything in the same style, maybe add a is_bpf_list_del_kfun=
c() helper?

>  		break;
>  	case BPF_RB_NODE:
>  		ret =3D (is_bpf_rbtree_add_kfunc(kfunc_btf_id) ||
