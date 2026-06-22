Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A1C0346E51
	for <linux-kselftest@vger.kernel.org>; Mon, 22 Jun 2026 18:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782154231; cv=none; b=so1HIt5r+vml0J9aL981Cp1VTS2yuAlitCBHFbopIjlTCY6raFSIuhylz9d5sS8kcIuPh2VT9kx0SbTay/K7ktGfXDsVL7Nl0741bBF4iTqjLL1fa2zRXAKi4GERms+UjPjOHusH9Er53QdMrdCLlF4IOvfHnI1wIWOZGkwXUb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782154231; c=relaxed/simple;
	bh=6CP8ytn9kEga82EaEb6SHoo5YmHT3Lz98rg8ozQ8T00=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=XTy0SCX/fRUNMQoLHVrYok6FQ2qJoMXSMz8YTsc9oZyDwd+uqdk0smJD1uJYOXXfEhn3zb2m+8kRwsydUpdmNPOeeGxR98klg2qtN3yHCry670RnMmuBkLdYv6NhXKa6FmfUVlU/ELlrnwsQIDPji2StOSNh+UYv7BMDkZBVS9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NC3d6mVk; arc=none smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NC3d6mVk"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-13986d61b4fso5756251c88.0
        for <linux-kselftest@vger.kernel.org>; Mon, 22 Jun 2026 11:50:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782154229; x=1782759029; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=6CP8ytn9kEga82EaEb6SHoo5YmHT3Lz98rg8ozQ8T00=;
        b=NC3d6mVkRkb37NTX3M6DrLbB/ZV99ryheF85ke7g4AqMKVkst8ISHHZqEDs6zzjTng
         1HhDnzPhxAD4XCpL8cXg+wsKs0e6CPiHTRXNGImozcuc+RT0JqXraLRXsVUSGwncbmw0
         iYZvRsz8cpX08SjMAmREjZw9xVJs0bf4xVzfvXL+OOhzEEoERXeHBADebnCYC7d36n+2
         nb3puXv88whNHA6PKWQ6CjuTGU7IiiaEueNMwHo29XHVBW0Q/4gwwG4dwYiFpbVQFI4x
         UfZV+CzT1Gktpgr9DR5WkdHpAOgnAxQtmIGDCdM7vkhU+xK6/Fox1Du3uTxdFymryG0H
         mIGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782154229; x=1782759029;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=6CP8ytn9kEga82EaEb6SHoo5YmHT3Lz98rg8ozQ8T00=;
        b=hx8woze8S5clgpZ7D+gfUmdLCtKYPnmncx8diDd/do7TGL5VN6E3GKODjmpa0/ZjJP
         DwuV5ZXjbsOXVyqmjmrsGiTU3v5zgi176sXiiNRMldPEvNHj1TZ0KAgacFDyv4Qs9oae
         diKKCOF1u/89GQ7D95CnKbvEXKqUUPxCIV0RfDy+DaVNYDg9ToENJPcmpdW0/gGXJgbF
         CjfmU0cW5k3J8OGIoHVJ8IivYFvuLwj3sWAbmbhbHJukQMvwEE9/lUMeRyVAKInZykAN
         J0GRDjyHYXRae+eWAUQFcQgDaJzB4xZQ9uXM0VGPK3DWNtDlMCLVmCIPliGF3OuRPKVA
         v6mg==
X-Forwarded-Encrypted: i=1; AFNElJ9YZJym0W7DrS8hvfHjDu6jhV/15k3B1NiCs9+maDD3gWuNxuzljk3RzCbiTbyl9cUZrW4hO9hTjTGuQvWgKTE=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYcv8hCisjsYe+oz9uhdXrHqvHWaHXoxYW9THiQ6kK7C/afm9w
	qxrJhgQqK2PV5UMxLlGqSdzU7TyQ7+f1V1IxhdK9IwRl/zaWTh4DqtU9
X-Gm-Gg: AfdE7cnOtoFMJtNTrvXrSQte1gfAh3FNJXGsh73DIVhuvXQduDDq853SQhIM18z5mIX
	Z9aze27eiZhSBMOTXhhxMF7vgBjdafMjf6P8NwoFeGYSk+YI3ZknBSQ9F+lTbY4xbXKQtP1SdE/
	fp714X7Cx2rmiG31ImQSy13UfyEMIZJpjdZOi+fOwjBjG+Qc9c3V47Pb5OnpwlZ3zhX6oONbcjX
	hAaeX/gfyKdtkNxxRobEFhKINJMO5ehZOH3nOi5Dm44Zh7oeyaM6Rce0Zr3TDQzKvnF7yrFMTB1
	hYY3Nqm0SHT8tKcZHOt0P+psmqCumsD1ijKpWuC33cO6MEldyLKGxXSoSRaVx6N9WzW+xDm+GMY
	3tBgpN47fmbtfFhO0VHzwELbSo78D0eDUM+qWH7tlKdLUJwoa/nRp/7au0akTHUGYoXZXYpUV7r
	Vnz2pn68iBm4+vAXbT0nz/ZRqGHMpd1rQ8SXxa6fvFt4FuGc4GuIcEoS6HoCZzRs0h2CA=
X-Received: by 2002:a05:7022:b87:b0:12c:2cf8:2f30 with SMTP id a92af1059eb24-139a205d12bmr10025200c88.15.1782154229019;
        Mon, 22 Jun 2026 11:50:29 -0700 (PDT)
Received: from ?IPv6:2a03:83e0:115c:1:6e2:c699:67c:63fe? ([2620:10d:c090:500::1:5387])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139add73a44sm8240512c88.13.2026.06.22.11.50.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Jun 2026 11:50:28 -0700 (PDT)
Message-ID: <08299ecffff6d5ba708b8de7693eb12a4775e715.camel@gmail.com>
Subject: Re: [PATCH bpf-next 1/2] bpf: Reject flexible-array allocation types
From: Eduard Zingerman <eddyz87@gmail.com>
To: Yiyang Chen <chenyy23@mails.tsinghua.edu.cn>, Alexei Starovoitov
	 <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko
	 <andrii@kernel.org>, Kumar Kartikeya Dwivedi <memxor@gmail.com>
Cc: John Fastabend <john.fastabend@gmail.com>, Martin KaFai Lau	
 <martin.lau@linux.dev>, Song Liu <song@kernel.org>, Yonghong Song	
 <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, Emil Tsalapatis	
 <emil@etsalapatis.com>, Shuah Khan <shuah@kernel.org>, bpf@vger.kernel.org,
 	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Mon, 22 Jun 2026 11:50:25 -0700
In-Reply-To: <c230ebd7f2e28e0cc3820bcb2701ec517933063e.1782100805.git.chenyy23@mails.tsinghua.edu.cn>
References: <cover.1782100805.git.chenyy23@mails.tsinghua.edu.cn>
	 <c230ebd7f2e28e0cc3820bcb2701ec517933063e.1782100805.git.chenyy23@mails.tsinghua.edu.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.60.1 (3.60.1-1.fc44) 
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2026-06-22 at 04:56 +0000, Yiyang Chen wrote:
> bpf_obj_new() and bpf_percpu_obj_new() allocate the static BTF size for
> the selected program-BTF type. A struct type can still end with a
> zero-length flexible array, and generic BTF struct walks have special
> handling that can accept accesses beyond the static struct size through
> such a member.
>=20
> Reject allocation kfunc types with trailing flexible arrays before markin=
g
> the return value as PTR_TO_BTF_ID | MEM_ALLOC. This keeps the
> verifier-visible BTF access shape aligned with the object size allocated =
by
> the runtime kfunc.
>=20
> Fixes: 958cf2e273f0 ("bpf: Introduce bpf_obj_new")
> Fixes: 36d8bdf75a93 ("bpf: Add alloc/xchg/direct_access support for local=
 percpu kptr")
> Signed-off-by: Yiyang Chen <chenyy23@mails.tsinghua.edu.cn>
> ---

Hi Yiyang, thank you for the report.

I think this should be handled at the btf_struct_walk() level by
checking MEM_ALLOC flag. And there is no need to check if the array is
flex or not, checking if the final offset reaches past the allocated
object boundary should be sufficient.

pw-bot: cr.

[...]
