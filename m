Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.174
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795200278;
	b=CnJ489iAX0PoK9HDgRdYe5QLSif0Gi1FKa40J1ntkW0lKSzd787hYKOvJSfbomXXXFZL
	 XUPxdJ47PVG5DwvCCHGEP6r7ncQukAJvO0cw9FLJKfYRh79KkjXcca1PzzrE/ktT8JtFF
	 wAk/ypsi/qg9yGfo+Pc4rrukr5vdSYfszpEeeP3RvZOiGr4oUwO+Nd7bYNbOh2QlLc9iV
	 5FJWGuG60nlMuzDUGYCfyZPNTGFsXmsALcE18VymDMC5mcZTAXQdln2//S73EYPkJPZHm
	 LOaPD7PkGZz98kdOxc37q/zc33dN8kvDSyOj74goBVF9CZSC9mZXxrXD9DfNjtt2qjA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795200278;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=Ge3pmyLmXCv4hB1zhJ0eXKU1oHUklR6Msezg+VICCTM=;
	b=FaJnTb6gNCWHAXGLYCWVgizT9biJHIiPFs5wwMm1UbNd6lLVOYJXMtGJicmV7G0VsggR
	 lUCWBkSWn96YIMbYKVxmuobPDjrXF/rwfDcgq0fsCW0sNxLJAvRNn4c4YMTFkjHIGlwvM
	 wcQM9wfmxogKPK8f+L33si+mj7VE2jusX9QctLe5GS6jIUf/4DWo3eIMXMsHT46ebOys3
	 hCrT/gd7TZb9Jlhzw8lBvjHZ7VX2/WBxErFlD6sxtzTMMvkUPgNZ8qYud68g7MBsa+YvQ
	 kzYsCxctMbgNLD8qwtGgZRki17+Q+EATrrR/t9HIPgczMmeSicGG7+iTNrczY4GzhkA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ZJr5zkin;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.221.174
Received: from mail-vk1-f174.google.com (mail-vk1-f174.google.com [209.85.221.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7872E60A2613
	for <linux-kselftest@vger.kernel.org>; Fri, 20 Nov 2026 18:44:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7872E60A2613
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=ZJr5zkin
Received: by mail-vk1-f174.google.com with SMTP id 71dfb90a1353d-5eadef147ffso930111e0c.3
        for <linux-kselftest@vger.kernel.org>; Fri, 20 Nov 2026 10:44:35 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795200274; cv=none;
        d=google.com; s=arc-20260327;
        b=JRa1FUNGzgYxG9BfUz/q8duzGyxDkUQ6TzA2BFyF+o1B6lzFpSDBluPIoqQkflEakT
         JmcjxSgYY1x7MdZ/7bN3bOf9w9srU+86jUFxYgH0RdB0L0os7V2dE9NOHGRNbtzX8b8+
         NRTGhAHbZ9z/Rn6gaYglDeGLfpun0KAL5Yw9UDgiPS938NU55pep8G6xgxtYJWpRTfi4
         yb1BxlolEFIMj7tHSh8LbtKYcq8JT4Vr/+zzwsN9I2Y+gPl8BBez+s1cZtWPuBhCznH/
         ScjwOnzpfKyM5dtYVrX/s0cGwwsaC4m2zy92seZ8SyUUKyT/RgdWWcvSLPZ2+x2XfIdV
         v+kA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ge3pmyLmXCv4hB1zhJ0eXKU1oHUklR6Msezg+VICCTM=;
        fh=kfjn+ZOkH3nb7fGgSkHh0bmPCM6kYd2lsGttBZ9/OYY=;
        b=KWVKxj72yrEU7PBH5j2s7oQXxPOpcBJCgxrVErR1uXZZQwr78spV7mEkYED9l790V8
         erv1YC1jXNvK4sUvLYyWbhv0qXhqKtK3RrsFmR7YONfyDJ6NrOgPmGeXezpfvpWg+SSU
         8poR72kdqYlyaOktFkCI26QT6vu822q3gU9z9r8hg+81eFYYWRRePjwu64zwvI+r7wcT
         PID4pCXV/kkNvpA53TJeaFSPTg/QqelDBH9SMrVUQM17fc0+HMYDN/B5+z1Iq/h3eFjt
         MIQ/m7WXm6WwnMFMquddiDkaUIUNJYoeZROSiczen/zUIgadJAKO817Ot3dlwjCPRTis
         hv+A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1795200274; x=1795805074; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ge3pmyLmXCv4hB1zhJ0eXKU1oHUklR6Msezg+VICCTM=;
        b=ZJr5zkinlPUjzP75ruooLP7bnWorZ6KrEMUYaB2+nsH98WYaKEFKXiR9A5uKaBjlf2
         a9k/J7Q8TeJU6JcxrwI04dMyEynnO7TSBGo7Qo4bfuE9VqxcaHZDV6dOjmqBndWcT5Du
         9BDlJjShUnHIguuNKB4eF4mQRXny/A4cdZZfc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795200274; x=1795805074;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ge3pmyLmXCv4hB1zhJ0eXKU1oHUklR6Msezg+VICCTM=;
        b=KXdvvRvr5GTtJR1n7CtMSBnEsUloOApn2igxr9eDeRcWpyGtl6+QbBpK8pCzascF6s
         Jo3dZRfY9yzjYkxUo+hPKwKqcQZuZoMfTmE02TjiJjmOdjnGPTHwXQLq//WqKqu4BvE9
         TzDT4fD/akiOccdlsBrJKVOQ/v8vdl4LUdD0blikwny913XTPm3vQ4aGCrd0twu2hIwU
         J86t1ukv6Vp5UnduiPxhokJtxYkzRaLfJZ5k7tTuBs7kmiFftftelWrKKxOZxrX5sVJh
         KX2knxv8dVbtjhZMMPclmMWbpSTqL9TkEBtyTXNDTRGJdbaUCMRaS01Hth0wZfICOP+/
         vkiA==
X-Forwarded-Encrypted: i=1; AL+hErFq21huh44FvVzt5LcjMWAuLiVlLxb4+2zGpN3Qbde3iCHEcDJtNjiWMUg2Q6GxmGsgvnhNDyP9mcp0oKsg+Fg=@vger.kernel.org
X-Gm-Message-State: APuU4Z//v7gdtwa85ianIC3kJ7RO66w6t4Dk4KurC7/sgB56Xyg+GiPs
	zQfqc1sxRBAbr+tqCIP6G2ShIYs9ft76zBBxalWGhuGT5lVPgRclFn+A8ci6x6VdsZ7lw/xGY1R
	gnLjcUgFzXxV+J5eaiZ4mzvQ1p+9H7ApwhMO1vAFkbz1W/Ukq4lM=
X-Gm-Gg: AZFdTZf4n4d8rcfdC9Ruj2FbVfblpAts/olKAHbKPSvPDbDU5ZAv/sz2e8Ef9LZXLpQ
	Xkh/hDEZ7FUA2I2rWhyPRDsrAP94YaqcO8l7eY/3G31IoTu04fOQ6PdRbuTYXC+jQkC9+2Lq2Xp
	3AcyNhZz3TUuxGPe+a7iJY1374hW2cJaNey24ZTmGT48ud7Fi09sPueB4JWw74ZkpHDIPLm1QW+
	SQAGlL0aKYNPkVleynbQbnnnm+hjPDOlSGq3texx0sAmXO2CrKw/iig6+3fVOKghgDD/slxe5m8
	/ocwSXaG23gM7aqk0DD29T4XKUuZm681aJUW87V7HxO3SGryBXcrN3zbQ9jidymYA+BVcHwCGsm
	q8PaqOz8Nl+7jT9cGnx3qR/KeK5aQjpK5xz426+fozWyGrGXttA589wg5I1FUbjf9ZoPclg==
X-Received: by 2002:a05:6122:30d3:b0:5ec:3e18:a188 with SMTP id
 71dfb90a1353d-5ee8adf1536mr2653900e0c.1.1795200274471; Fri, 20 Nov 2026
 10:44:34 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <cover.1791023194.git.tjdqudcks0424@naver.com> <d7e10b50556ab3b79c7132018249f6f7c608411b.1791023194.git.tjdqudcks0424@naver.com>
 <asLNxHYQ/xQ6KaWy@hallyn.com> <CAHC9VhRMCfahvx89HjSoHfyKR27swLdt2HZuM1enmoi_gxRyRg@mail.gmail.com>
In-Reply-To: <CAHC9VhRMCfahvx89HjSoHfyKR27swLdt2HZuM1enmoi_gxRyRg@mail.gmail.com>
From: Micah Morton <mortonm@chromium.org>
Date: Fri, 20 Nov 2026 10:44:23 -0800
X-Gm-Features: Aa3M54rASSxX4QbVhBp00t0f3m1HpQ0YSwFJsYfciMSYXLIVp5sGFTUKS5zqr18
Message-ID: <CAJ-EccMjtVkvM5bZzUKDAPcOAKZbd1Lc59oNrW0U8m=s+4R9eg@mail.gmail.com>
Subject: Re: [PATCH 1/2] security: safesetid: use real GID for GID policy lookup
To: Paul Moore <paul@paul-moore.com>
Cc: "Serge E. Hallyn" <serge@hallyn.com>, tjdqudcks0424@naver.com, 
	linux-security-module@vger.kernel.org, James Morris <jmorris@namei.org>, 
	Thomas Cedeno <thomascedeno@google.com>, Shuah Khan <shuah@kernel.org>, 
	Christian Brauner <brauner@kernel.org>, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, security@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 5, 2026 at 4:26=E2=80=AFPM Paul Moore <paul@paul-moore.com> wro=
te:
>
> On Sun, Oct 4, 2026 at 6:05=E2=80=AFPM Serge E. Hallyn <serge@hallyn.com>=
 wrote:
> > On Sat, Oct 03, 2026 at 07:34:15PM +0900, tjdqudcks0424@naver.com wrote=
:
> > > From: Sung Byeongchan <tjdqudcks0424@naver.com>
> > >
> > > SafeSetID policies constrain the ID transitions available to a task f=
or
> > > each source ID.  id_permitted_for_cred() always builds that source ke=
y
> > > from the old real UID, even when it is checking a GID transition.  If=
 the
> > > real UID and real GID differ, the policy attached to the real GID is
> > > therefore missed and the lookup can return the unconstrained default.
> > >
> > > On current mainline, a test task with real UID 1000, real GID 2000 an=
d
> > > only CAP_SETGID obtained non-allowlisted GID 2002 despite a 2000:2001=
 GID
> > > policy.  The bypass reproduced for setgid(), setegid(), setregid(),
> > > setresgid(), setfsgid() and setgroups() across three clean QEMU boots=
,
> > > and enabled access to a synthetic group-protected resource.  This sho=
ws
> > > a SafeSetID GID policy bypass and group privilege expansion; it does =
not
> > > show direct UID 0 elevation or a universal local privilege escalation=
.
> > >
> > > Build the source key from the old real UID for UID policy checks and =
the
> > > old real GID for GID policy checks.  In three fixed-kernel boots, all
> > > tested non-allowlisted transitions were blocked while the allowed tar=
get,
> > > existing-ID, no-policy and UID-policy controls, and the existing Safe=
SetID
> > > selftest continued to pass.
> > >
> > > Fixes: 5294bac97e12 ("LSM: SafeSetID: Add GID security policy handlin=
g")
> > > Cc: stable@vger.kernel.org
> > > Assisted-by: OpenAI Codex
> > > Signed-off-by: Sung Byeongchan <tjdqudcks0424@naver.com>
> >
> > Seems obviously correct.  Thanks for the find and the fix.
> >
> > Reviewed-by: Serge Hallyn <serge@hallyn.com>
>
> Looks good to me too, thanks!
>
> Reviewed-by: Paul Moore <paul@paul-moore.com>
>
> Micah, assuming this looks good to you, are you planning to pick this
> up?  If you would like me to take this via the LSM tree, please let me
> know.

Hi guys,

Sorry for the delay! Yes this patch looks good to me -- thanks for
catching this, Sung!

It's been a really long time since I sent any pull requests to Linus,
so it might be a good idea for this to come from the LSM tree if you
are up for it, Paul.

Let me know, if you think its better for me to dust off my old GitHub
repo and pull request etiquette I'm fine to do so as well :)

Thanks,
Micah

>
> --
> paul-moore.com
