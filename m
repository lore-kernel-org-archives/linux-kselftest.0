Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EABEA447255
	for <linux-kselftest@vger.kernel.org>; Fri, 16 Oct 2026 19:06:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792177586; cv=none; b=OQDs9gN6k8Q2WdaAiCDwcTbpn7ticC8ooqn5GpTlGtMrGMLFmzVgdbjthhVvV1TXZ87b8oB/PiOG7roIFoxxk3yU438yIRABsdwRmT5t82Ns2mhNkWTqoUj56Ear/ePgBCMqs+UPceFFkyXEBTSLeo9gkp6N2bS0AbXM7/Fydyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792177586; c=relaxed/simple;
	bh=OpMS+6FzySrFV1lZQmnL5w19GqRngTRsLy37qcsUoFA=;
	h=Content-Type:Date:Message-Id:Cc:Subject:From:To:In-Reply-To:
	 References:MIME-Version; b=eTVQ9Dt4ImcGun0BzOfPt7m+A0vY8pUd8yeVRukOJAQjuSK3wQuSDmuVK77ErBM79JaARO09RPc5DK2XZl9Vua93X3TIme0sUajgu6ZrnUn7HFBmyOadcDITcNH0Huc0IMFOBjO/045khyctaFbU0eJ0uu5sdVcCQS7Xr2PpnTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TVzllX6t; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TVzllX6t"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-89f1318195fso166932b3a.1
        for <linux-kselftest@vger.kernel.org>; Fri, 16 Oct 2026 12:06:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792177584; x=1792782384; darn=vger.kernel.org;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hSRgHunWgFpzvexlIiLUerDvkn0BvQ3M9sVaWvKaM2o=;
        b=TVzllX6t4/7axJ44qluE3Wqf24CWAeXMDP/8PMzgpG4edCwkSNK4FxNCXc5m1M39ju
         pYHOqkbq47OI72DdsWSNKjsLyWNa2p7dZfNcI3913KjYjUAP5PVQsAaHK7wjZWUiwJlP
         cMhy5csnEi6W8LKOtFQTk1v6TK4mgjIb0p/aGQZqWL6Gwo+D4eNH4OTLq8DWYV0Ek6rS
         fUgs0dCBjA63jMds4Ee7QgLeEbb99Xmqy4auhUEvZIbLpPb2t2OCGtlgW9fKQxb7G4lD
         pRgvj3KVqKUJN32sdge1YObB4QsRQxn6uWHW/rK+mQo+a7MRFRr9eT8Oe3YD2+2QJBh+
         478A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792177584; x=1792782384;
        h=mime-version:content-transfer-encoding:references:in-reply-to:to
         :from:subject:cc:message-id:date:content-type:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hSRgHunWgFpzvexlIiLUerDvkn0BvQ3M9sVaWvKaM2o=;
        b=l6WB6s916TxxXJQFBcCE8dVF1z4b8H1uzLcK47WdZKdzT4b3JSJqj12vJoAZT7hTr/
         dZPBmTfyuXnaC44rDiWU13InpCzQHStMcdivrff0dZy8j5BcgM/It3gTKLzyXKoKy5wM
         fkbCqBxAyH2SDHapO8q9At7iBQ6xZZnVa0CMREF3ybJ2ywSe/nTRSDTtLFlekoOYcJyS
         coOChHOAYsFDXc2ofGBOSxTEwWqSoQDVJEKd4twxzKD89PzHs7f/BwYD3CGsAM3lNUwA
         IzcjyOVdCmhIAzLvnnPygnSbOa6tYyiHB0z+IoejwWUoPrZVLtlISlmWQNhUaX+ZP2a3
         3kbA==
X-Forwarded-Encrypted: i=1; AKwUvBzzzjug+NEgX5CbE2fvBBby8G8RztNrPkDdbuDca7KKUUiGxzJpG8Fjw46sGjUkWTKUxVEsLzvSTcYcHphdZww=@vger.kernel.org
X-Gm-Message-State: AFq9FYJSuTTF3GNJTAmDyaoY8ywZ7jjExoARILHjY6oCEOUNpL5fxNXV
	BW8hYdY4YDBBoGMQdd/mHTM3Vs/oukDXTk+faWoPsflf74zktWH9IUYc
X-Gm-Gg: AYBFou2wzjz1mW+vAQjbF22GROTsGFiSMDyY+LOQjvnuiRPNfGQ+gEQfBHla4XrEvuU
	0R2M+Dy9/Ed+JSjehFqWqGA2dMwlUff70IFQYrZyIlStZYtNPxlKWPd6wLAwxiINiFD9oaIJGgs
	8+BC8y0n6BCmdREhkLl7iMOgzg3DYZh1+W59EeMnIuG7fzTZUksDAYg1PJaGMe9olN+ZYGNSV/k
	jRvzsOmiBrxiWB+mqgVPmvde8RoOSFH/JrOqIe+FhuaS9dcdHeak8FIkqaFf6bWj3v1RR0vjamm
	AgCOzW9rhPcDyCBoDFHHr6BMdMk5aWHJwOEjTpECXz8RYb+j0jxq5lV6K915H6Nkm+NfP4cpP4h
	U2v0mQ5/LKZUCgISImidI0a+b9eFlYlVTONlorefo2Kny2ESdQgkOn7hhX/FimjZ4XzEDgOVSww
	V/ragqfOYzp20KawIi5mPDB2xkHQrpQKAgaLFRiEDAWXqLIC+zHxOK2iX90YxNf5hbiby8xL2mQ
	FIxzrDF5jCSkY0CFHGJLwEvrYrLMVhd6eVxkW4teilQ05Q1SOG47t2iNpLobWb/+t6bE/7a6IKx
	6ks=
X-Received: by 2002:a05:6a00:2da3:b0:89e:43ee:6538 with SMTP id d2e1a72fcca58-8a04be62fc6mr443146b3a.36.1792177584089;
        Fri, 16 Oct 2026 12:06:24 -0700 (PDT)
Received: from localhost ([153.61.198.248])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-89f5735dd55sm1563594b3a.26.2026.10.16.12.06.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 16 Oct 2026 12:06:23 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Fri, 16 Oct 2026 19:06:22 +0000
Message-Id: <DM6HXJLRTM4D.H1WFBHSKIH2W@gmail.com>
Cc: <bpf@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH bpf-next v4 2/4] bpf: Dissociate struct_ops progs before
 the grace period of the map
From: "Alexei Starovoitov" <alexei.starovoitov@gmail.com>
To: "Qiliang Yuan" <odys.yuan@gmail.com>, "Andrii Nakryiko"
 <andrii@kernel.org>, "Eduard Zingerman" <eddyz87@gmail.com>, "Ihor
 Solodrai" <ihor.solodrai@linux.dev>, "Daniel Borkmann"
 <daniel@iogearbox.net>, "Kumar Kartikeya Dwivedi" <memxor@gmail.com>,
 "Martin KaFai Lau" <martin.lau@linux.dev>, "Song Liu" <song@kernel.org>,
 "Yonghong Song" <yonghong.song@linux.dev>, "Jiri Olsa" <jolsa@kernel.org>,
 "Emil Tsalapatis" <emil@etsalapatis.com>, "Shuah Khan" <shuah@kernel.org>,
 "Amery Hung" <ameryhung@gmail.com>
In-Reply-To: <20261016-selftests-bpf-struct-ops-assoc-timer-v4-2-9ad31c21220c@gmail.com>
References: <20261016-selftests-bpf-struct-ops-assoc-timer-v4-0-9ad31c21220c@gmail.com> <20261016-selftests-bpf-struct-ops-assoc-timer-v4-2-9ad31c21220c@gmail.com>
X-Mailer: mkdraft (claude review draft; edit before sending)
Content-Transfer-Encoding: 8bit
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, Oct 16, 2026 at 10:59 AM Qiliang Yuan <odys.yuan@gmail.com> wrote:

> -	map->free_after_mult_rcu_gp = st_ops_desc->st_ops->free_after_mult_rcu_gp;
> +	/*
> +	 * A prog dissociated in map_free_pre_rcu() may still run the struct_ops
> +	 * from a bpf_wq callback or a sleepable prog, under RCU tasks trace.
> +	 */
> +	map->free_after_mult_rcu_gp = true;
>  	map->free_after_rcu_gp = true;

In v3 thread you asked whether to leave it to each struct_ops.
No. The owner of struct_ops cannot know whether a non-sleepable prog
starts bpf_wq.

bpf_map_put() checks free_after_mult_rcu_gp first,
so free_after_rcu_gp = true is dead now. Drop it.
st_ops->free_after_mult_rcu_gp only picks the gp for cgroup prog array
after this patch. Update its comment in struct bpf_struct_ops.

pw-bot: cr
