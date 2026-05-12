Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com [209.85.208.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2ECBA3B840E
	for <linux-kselftest@vger.kernel.org>; Tue, 12 May 2026 15:29:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.172
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778599780; cv=pass; b=rva6Jo31fuGQr04RWWTogamiW9N9MwCgj/qI+ISLYidRv//mJzwZYA3yi0BnqYF455j3FTutXtElFqXy3k2UZWsjNS3+YOWRtcxaPUeQG1HQU1Dfak1PIWJ1cbjNPpU0fdc8RMhs/EMggigJdOnPu/UFna6gQWwtWMTJl2Gd4O8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778599780; c=relaxed/simple;
	bh=nBOsokuQTzbairGbsW+8mrF8HggOp9/BLLPnZTJwHvg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EXI7iOZ7EQ6mmuAAYTiaqFAaKVjklWYIJDEzsdypS7oh/qe/0X4ltjEDjqcC5zYx26swome1wH4wN8omiEO6VKwHl5eJLZQdY3nuhOly0O5U/2Mk5F5DAU9F+bRjGiJiPTT4cd1pwVuf0neNMyIBQxdNotbZ+fgDLRDJTJsbZJc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lmhjAiGQ; arc=pass smtp.client-ip=209.85.208.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lmhjAiGQ"
Received: by mail-lj1-f172.google.com with SMTP id 38308e7fff4ca-38be5e86918so71419041fa.3
        for <linux-kselftest@vger.kernel.org>; Tue, 12 May 2026 08:29:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778599775; cv=none;
        d=google.com; s=arc-20240605;
        b=N12cHw5S2JBTjsA5buPOfQIw/dwkvILBiRjjuRpKqJGd0EBDiYK2xvYXJhflkKi8ph
         EhYdUWdf+zSryJCDZbLBOqREO6+bvBLvaSxpOX6i/CPdI+WKxYTEmrQcHfd/50rGpo38
         KbuRmv+jt208Q8LwqMOIxS12U5UP0jls6Ov8A0Wp4EsKXB1OuLte++qvDglJ6ri6l+Y2
         fZ4ksl5WHexX78sEF+4saEh7pf9c5AEMhUj5jgJB7x3s+zBKbug/sNvnhNseQwo/CIUg
         caTuTuX6/4hInslKdN9VTko8lZC/sS1vnoRfz2ax8b5FXTXTsMOU1bPI4imMHQ4Di1lO
         3LLg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1m8Vx7sSpkFzoMEAPBBuv0g6bgC7CqPm0P/FXD5R46g=;
        fh=skQWcE6POoN2Z855xj2INrVNuDadSmHiQQcxxjzLzzk=;
        b=bh3sWRHWldSNB40BzKjbxDj/n4vP601dT060hrikxhbsIKjkSnksJTu4cFt3OKlRBn
         hDc60YhazMKvqlNYbzW5W76FBVZINk2vyScvJIaXwv/+oLk7E80GjIouGmsF5WP1qvcv
         5LfxmYuLECpnI1B1euXrgZaokUEMBP3MXNg4B0kJoPLf1JdoNaylZ6nZxEhntvo3kKzD
         CXKxKkRt43lFKcP/NJj++Q45Pbp2UqkyuMjHgBDh6KNoSAgIIUZOkMvh7+6OPRhLL+Lx
         mKmmw+scO2OcRaNVvaQu2o5liGYQZErHFq6Sy4VhUxijUs8Dj+HlxlurETNa+7qaJwwz
         5SsQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778599775; x=1779204575; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1m8Vx7sSpkFzoMEAPBBuv0g6bgC7CqPm0P/FXD5R46g=;
        b=lmhjAiGQCgHEWw+c7/vusbnRRTEmWd5mKRYWnFGpPjMi+92f7E1UmqoSaYt3CE3ExB
         3G08pDqoHoST+dNCLHIjkeQsGOb8CgGROp5/xaS6EBUQjpRM63MIXOOw1uL2hdRasQRI
         aaGHo5DvCsdZIvHxTirBWgMahpsyDRXXYAiHEDo3yXKt1urNqx/trlFsGhCZyPOc+uUi
         eg30NdTqqdHkMbwduFBTbX2HAUCFLTnTPOUq+hR38Qtc1I04PhN9ICSTP1m0pGizDTMP
         oeZLKSA+e6d8Vocyxzd9QPs6RC5nl22cjgC7D+fRZEFbI0wfulrxZ5ZYiZMVjqpOvRaH
         Z41g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778599775; x=1779204575;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1m8Vx7sSpkFzoMEAPBBuv0g6bgC7CqPm0P/FXD5R46g=;
        b=iUFifJQm9uzbCRCQHcx2xSdNylNZDUuTe28nDN8rDanGIO9je5a5cBJy1PU3dW8aXG
         1b7U3SjjqM7DC7MUxCU2pRkTEBW2rApx9Hzvppq4RbzZUZ9+zmKS5sE5BezGHRMCjuGl
         9Jpij6q3KVEokbDz80GmmYxa32/mSukyxzuKEobjw4QPYmyCNGcB/IzprpVxvPmCObN1
         Jjkud6v2bnwB8OueTC2AQj8r/uGqiDrINKUZRTMWeQIEP2y+ylgWyfqAOvazo787ssxH
         jO2EHaZ+/t9TiYdsPtZPc7JxURPU0jJOrmmueRPiRpIatsOkj5yPkY6qC+h3o35gvUtV
         Jntw==
X-Forwarded-Encrypted: i=1; AFNElJ+WV+hQg2iJaSR8zM7tKb4Hhq8RJWnN0vIgr5BpHqo/tjyWB6B9WgpS5EyJEgP4P3L9kCw7/XFz+egZLgHO6Yg=@vger.kernel.org
X-Gm-Message-State: AOJu0YyWfMX4dELnXnQ6uajY1OS2PdMl+98MU6CykmURwmMqn566t7fw
	0DzFzL4lLT7fvrFqnozlomdzae0LJDQ25yNwqH8if5/QvyXhjnql/LWkh2OQE2jTfHLNrHSsKLt
	wojyStOElJl/4YtCQYGxkFyIZo0nUy3Q=
X-Gm-Gg: Acq92OF2Lnk/RcQY9GzBjL0A/nIkHvc2m8PWioBiUHXEIIawJMN/YA7BYpcof7G1gus
	TyjImEUZECCFDz+zN9UiVS0EIQhh3aDUavT3sz2nucEj6A5T4f0em7mNx8Rkh4bEeNeI1NkqRv3
	KOrvtv0LuTDr3lrd6yy4L2HWXrM4lqcQW8BpmtgmWrIfvYVPyI58THDy/TYmDJspXRrYhANvio3
	GO//U8cDM9OYU66Q/q3z/qJBzPLLnRP5/LrRInY6EGi3Fgb5FtWf3QgYRQezJjy7hJ3Tszb48lo
	YmSv0ZLTgPDLq7cM+sdwaM1VFwbi44dRxAdUvISIjqLeTlAoObWKwW1Gz6xFb5QwY2ROZDbmPLe
	m+hk96pSx8Y/lu0xDHQ==
X-Received: by 2002:a2e:bc28:0:b0:394:2b8a:234a with SMTP id
 38308e7fff4ca-3942b8a5e7fmr31619441fa.25.1778599775037; Tue, 12 May 2026
 08:29:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260512-swnode-remove-on-dev-unreg-v5-0-0035eff63812@oss.qualcomm.com>
 <20260512-swnode-remove-on-dev-unreg-v5-6-0035eff63812@oss.qualcomm.com>
In-Reply-To: <20260512-swnode-remove-on-dev-unreg-v5-6-0035eff63812@oss.qualcomm.com>
From: Andy Shevchenko <andy.shevchenko@gmail.com>
Date: Tue, 12 May 2026 18:28:58 +0300
X-Gm-Features: AVHnY4L1_zJHNRi354c-jkblkHr8hmHJHYehCTnWbdMU5vf_KkUdHclsjlbuBjY
Message-ID: <CAHp75VcdbpY+DfFh6b61U61X6or0KoVs_akygnAgW27XmmXo2Q@mail.gmail.com>
Subject: Re: [PATCH v5 6/7] kunit: provide kunit_software_node_register()
To: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Danilo Krummrich <dakr@kernel.org>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Rae Moar <raemoar63@gmail.com>, Andy Shevchenko <andy@kernel.org>, 
	Maximilian Luz <luzmaximilian@gmail.com>, Hans de Goede <hansg@kernel.org>, 
	=?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>, 
	Matthew Brost <matthew.brost@intel.com>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, brgl@kernel.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kunit-dev@googlegroups.com, platform-driver-x86@vger.kernel.org, 
	intel-xe@lists.freedesktop.org, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 12, 2026 at 3:00=E2=80=AFPM Bartosz Golaszewski
<bartosz.golaszewski@oss.qualcomm.com> wrote:
>
> Implement a helper for registering kunit test-managed software nodes.

...

> @@ -10,7 +10,8 @@ kunit-objs +=3D                         test.o \
>                                         executor.o \
>                                         attributes.o \
>                                         device.o \
> -                                       platform.o
> +                                       platform.o \
> +                                       fwnode.o

You may put it after device.o, 1 line less to change.

--=20
With Best Regards,
Andy Shevchenko
