Received: from mail-ua1-f52.google.com (mail-ua1-f52.google.com [209.85.222.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E582A248880
	for <linux-kselftest@vger.kernel.org>; Wed, 18 Feb 2026 16:16:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771431402; cv=pass; b=ExAXM5X0jwyD3dCMrHxg8XF7LA1suLtbKrCHHU6IT3Xf6Yq1BAAs1H7BTMtO389ZVRRbjEKuEj+esBL2MhN+9zwRlTbNiac03S1/UTQy6i95mOoDHTMVcv2BoLKmNKY/JW5a3t4i3lprOXfy0nj0I/tmD0+dmnAWTelziAFiwqI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771431402; c=relaxed/simple;
	bh=Rb0aJpPuTZbiX/sAH/Mhd1I0HxysgNuewGPntopAVLs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H4J1unrP1TqL8csDz4N7TU9MBGuD4OLpGZxzAku0OWWL2eQF0HGiGCN3x4FDRhcmTsa+6x51yaKRYrIc7ev1jhCGlbvEQ+FW/BsXcTvC4EzEQhq6suZ9CVv+wPoYLFxRzgbJb+BI277eSyrcIlKMT2PPcAY65d9dK/4A4SpLfqU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aGQ59qt3; arc=pass smtp.client-ip=209.85.222.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aGQ59qt3"
Received: by mail-ua1-f52.google.com with SMTP id a1e0cc1a2514c-948bf40406bso2561241.1
        for <linux-kselftest@vger.kernel.org>; Wed, 18 Feb 2026 08:16:40 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771431400; cv=none;
        d=google.com; s=arc-20240605;
        b=fjngaJw4eMfA/YwUz2+Y6Bq1av0D51pi1F6Ksyrq0QqomBVosbJM6ffuBHFbL76IA6
         sFt0Z8s2c90kJCWXUT7tfmCsrwC/nPyHDtelbDV3CKD93HAGzdCXjz7yiW9Pf4sX/lf4
         Lhsgr8IyAZF7kP5yz5AKEvffs4FsklaKqLNms8rKV7AbKm+F9GqffwoN9RkLDP5U1Sqo
         23n5WBDEoLfUWw3fK6jrs3igFPJyjqShQg9npNNMgydynhus/2jjOjZg4/tzdC86HljO
         hMIHhhQa1snPWxy4dM8pJyMMk7Mkso7IqVR8m3whdldcUGM47cxDvN54L4jDdLvznHn0
         AmwQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Rb0aJpPuTZbiX/sAH/Mhd1I0HxysgNuewGPntopAVLs=;
        fh=STluDGEYuNcnwLMPiDN4RGbtNi4/jd4rupgXtV53ofc=;
        b=ekdkDkr/KL5Yy/7z9K1wG5ZIXNw5PtA/2vykw73cPojYA2Ok+gj6oJyoZ66nzWzL6z
         2t0jw9zjXP8X7fx1bhKOpvf3iX6vn3C63JY05R6OxdZNyGEZh4XABMckFdXd+Atb74xY
         rJY4I+O4A7BRJ+hgz8z2sSREJklYkEVkBzOLPhADHf0/O6iRC/bxymvj/FGcfulgDR5s
         EkiK0axXF4aihcNNQF+vyM4z/Lg7pfUUGcDgTktZA+RTJmUKyY3En1vGJbSQSHE9rgrY
         hyEkPPto4LwCWIIY9cTyje/GnHWJPjiSIybVrfkXWt14nvOcldK2B/eHQpZ5cJpax/t3
         iuSg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771431400; x=1772036200; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Rb0aJpPuTZbiX/sAH/Mhd1I0HxysgNuewGPntopAVLs=;
        b=aGQ59qt3lxjvyW5qgAPBjzAhFrLxnsK0pjtDclfrXOH5rLnETDgSltMwNrRzoFYQw4
         girL7QFOhKBoZpA8/wy0GRDYU1vPshk1rxANkb/5d6oRe0q6oWJLxK1aoqQN7MEiduDg
         ke+DtyFHtOD7BUyVaa6aXnteqCuAWZsgADWjyW4hXJv2dTQ+NAD12SEM9rlZCWpPGOkZ
         0CjrRqKKbYt9OsfzjfQPBl7u778hsRx1+frTDWI8lDOBnr7kZx7TvDGBSJo8gp9FN3Q0
         y5EsaTzap7fLkyiW4PQWtZnTr/gjs5B1r/6U9aGwNR1MTSiUxVZ2KXeVzQpRSnAoy61w
         jEjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771431400; x=1772036200;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Rb0aJpPuTZbiX/sAH/Mhd1I0HxysgNuewGPntopAVLs=;
        b=pBcQO0OUakXd7ANY81KChZn7sBIhANj1Vgl0eMhqwyhaAw+NMfNsMw1tmi9ERu/IBZ
         B/bsKPfoq3FN/QNXhuVH2YAXnXQzvpMJJicamdjGqJsGuxLFDBNCfJO/wlrPKr8mmOc8
         LsR0ay9HrckqZfh52L1rc+Vm8YdgzXpHdz541BaGv83p30pC5dOEBmnQCOwwKfRXjew4
         8BQATi0fbePocp3WF3ezp286TxrQdUDKhecyjJhNTbLfUTs2lJVpI2VFOOMYRpiBiHUL
         MunBRHx1JqxTvA4TDQwnh63cT4mRLL3l1gOF9AbtFB7cFaVwVcymIZts7TEqpnwOtaJa
         v9JQ==
X-Forwarded-Encrypted: i=1; AJvYcCUZ6OngZccY02nbDyw/hYvsFae3vOkGbpiJ05RPDh62sWPRF8riWbYAf/VjjuMnfbr3BOOMTuUXVtnoCJny9oU=@vger.kernel.org
X-Gm-Message-State: AOJu0Yyfgt6rdujlXJJYpgWWy4/hFqJQpho2X1fo5IE9XwdlM8jqus+J
	YzP+oX3R4SSwcp0UwWfPUIXH7Qt9r2Tg3tcFrkz3xeksC9EqqM+LA8/SCHKRbXRio+QeWh8Mpo2
	wY3kTtbDvxx2Gb6G8zC4xGvLVqGzuIG8=
X-Gm-Gg: AZuq6aIpcNSdZsOOvMUEPKZ4H2gdJG0K5m7GDGm6e7aGds7YtkhFWjEnv/qR1DOXb8h
	MortkPH3SLlWDoVnMicAWG+ZHVinCtCybOy/QJ8lGbTP3zkhSbNe9bD4xNExMuu25IeRydrtsBO
	y9ajdMFFYvjYz7nDP1r1r3M5HrjsDQExF4sH+BFRXD/WJ/jwLWp5fr2P8FJiQZI7HgXZoTtEMGe
	7H0JoHKye/1/LQ0ud9ur/7q/jhVTrMdLqymzYJSd/RqBK0KcwjFMbqoINf9kWmmf6JyFoD4lAbB
	KCVY2+v11n0DjjNfuSqpnMWvEa6mG5Dikh5SvIhTmJwGr8LMZIVcWFiEboabig==
X-Received: by 2002:a05:6102:942:b0:5f9:362a:8e61 with SMTP id
 ada2fe7eead31-5fe2b003fe5mr4897521137.39.1771431399417; Wed, 18 Feb 2026
 08:16:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <bb4bf5fe648ac71c969c6228ac6e72ea85cbc64b.camel@gmail.com> <20260218104328.14341-1-slava.imameev@crowdstrike.com>
In-Reply-To: <20260218104328.14341-1-slava.imameev@crowdstrike.com>
From: David Windsor <dwindsor@gmail.com>
Date: Wed, 18 Feb 2026 11:16:27 -0500
X-Gm-Features: AaiRm53xQrJ6ikwNR6kkTu1MPp0M2xsnhx4ti2O0jpdoLOolu_Zzsh4x6LDX49E
Message-ID: <CAEXv5_jU_OvD8abO6YC-sCfcRpTt0xNAyb0zUy9Km-U8TTDdQg@mail.gmail.com>
Subject: Re: Re: [PATCH bpf-next v2 0/2] bpf: Add multi-level pointer parameter
To: Slava Imameev <slava.imameev@crowdstrike.com>
Cc: eddyz87@gmail.com, andrii@kernel.org, ast@kernel.org, bpf@vger.kernel.org, 
	daniel@iogearbox.net, davem@davemloft.net, edumazet@google.com, 
	haoluo@google.com, horms@kernel.org, john.fastabend@gmail.com, 
	jolsa@kernel.org, kpsingh@kernel.org, kuba@kernel.org, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-open-source@crowdstrike.com, martin.lau@linux.dev, 
	netdev@vger.kernel.org, pabeni@redhat.com, sdf@fomichev.me, shuah@kernel.org, 
	song@kernel.org, yonghong.song@linux.dev
Content-Type: text/plain; charset="UTF-8"

> I decided to address only multilevel pointers as this is what we
encountered in practice and have to use BPF helper workarounds.
I think there are no technical restrictions for treating single
level pointers as PTR_TO_MEM.

Hi Slava and Eduard,

If we add support for writable single-level int pointers, we could
trivially implement bpf_inode_set_xattr in the way that Alexei
originally suggested[1] when it was first attempted to be added.

One note, for this particular case, the kfunc would need to be able to
write to the xattr int* param, as lsm_get_xattr_slot[2] increments the
LSM-internal xattr_count. Others would be possible as well
(cred_getsecid).

[1] https://kernsec.org/pipermail/linux-security-module-archive/2022-October/034878.html
[2] https://elixir.bootlin.com/linux/v6.19-rc5/source/include/linux/lsm_hooks.h#L215
