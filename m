Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793893066;
	b=K3QZwlXJ70WDgMluvccIfPTs3aSBHi2oZn4IlGlqB5P8sqAMUO9W6tURfN15OmDyKRwb
	 U5rMiF9u9SZLM47IpUNRyhloXzX1vvkroeb7z+cp/CcQCWdGp5Xf8kuNFa9J2VLEpw+C0
	 aYRvLYd0GcC3INdRUTcZ9QSPeNnXePl6V/C3qhXrYTh1xvuAdrmFEjajZWFMDsSaMh5BM
	 cskBFo7uWSGM80J3AQcXf88+XM1Kbr193+v/5ui5ENFtpZbtfEVt6OXnFAXX2nc38Xsij
	 S7C1FH6y1fCgFhv/S4dI5P8QzG3Ib6RiBmEWNfn++ggDil4vWhu26iY40wLtxqSzC1g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793893066;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=fet26sVrxKqTmXFV5z0zr0pfRaJkw61an1sCfVShooQ=;
	b=sZQhtq7iFrBX9mQnftEfyc2HTO+XQKeGU1AgkAJ0RIt0F5wcERYsq+Y2I6J5h14IUptW
	 79UZxVhh17U2/Rt65m5rUZwx+Hv5HMnZh8K5RL9bbwGMh3E01wK3excY8J2enLFb2913U
	 LgT6e9z94cHn3+sxKTPtQPaXOcyWpD+r92wojxF8itqmyY4F+Bk5DQ0viDoTtRJr3GIMQ
	 9fzA/YXnRjii5hKcGJrDe8D6C03CKzlWrfZ1SaJdmOnOftBe41nOgbLTSnLY8lbQRr1lT
	 gMdGM4qeqkKhy1KlP2njTWM3rwunS5mpub/0edz+FzxYpPoJTrfoxgh3XUwqeiWAS8g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MI7FeziX;
	arc=none smtp.remote-ip=209.85.128.54
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com [209.85.128.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9B7C606A331
	for <linux-kselftest@vger.kernel.org>; Thu,  5 Nov 2026 15:37:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A9B7C606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=MI7FeziX
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-4a549cd7fd2so8870835e9.0
        for <linux-kselftest@vger.kernel.org>; Thu, 05 Nov 2026 07:37:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793893064; x=1794497864; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fet26sVrxKqTmXFV5z0zr0pfRaJkw61an1sCfVShooQ=;
        b=MI7FeziX2e+PiUMoRCZ1LaVg8Ln7yDJ5UrS1YIsru6G3Vz6euXAONYeEpVryTIQrcF
         hukPnwTDZoGv0MG2l34dSNeapvlrO+NSQXuQenpe4A2lbX6LBo0Dx7oENYMZuvTOXtBc
         h3dPRN3mL5q1gHJYHQOJzI9l6uvbhyqui/Fe47QvccQEvupfXKAVC4CG+xfKQj7lKYvQ
         14CK/TzKtYYhNWrAWI+EG2hRBoIMZpjcHXY4et7icjQJFvtcBOhcuFrO1VYzwR8uWvb9
         Gm0sLXjwCX7C9J4JTm4vTwqm36Ky5zg9AN+IxYdue4DbWTQHG1PlqB3zvoxH8mbF4q74
         iI2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793893064; x=1794497864;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fet26sVrxKqTmXFV5z0zr0pfRaJkw61an1sCfVShooQ=;
        b=uQWh+i9dvVr8s1Zsxd5ee/6YK2vknA/9mx6nYiu8fjJvXE0M3fLqa+30SCFtz6FD8/
         dSLRo/rck6B0Wgt0Z2yQnQ00BAGpgiu0J9GecrnpdN3k7PzJf6TORbkpM00xV71sI1a4
         QipX//abOqHDiRTYGZNbHMEBJ9haxh1d3ZSwrx3vEOSIUmqz1u2osmA81Uf6y82WTGp3
         W/AdmSOSus2uuRDGBInaaeom7L9PE7sOH6ejGOJHtu4YoGq3v8a2gi9kO3fQTP7+dEgq
         Jr2Nn+J5KN6rO/5vf3qYTeuBVRvWY9nyZUp9SyFXZ03zWw8BLSTt7bL6xsE0FSz2SuAF
         ZLKw==
X-Forwarded-Encrypted: i=1; AKwUvBx3F75x59fObbUWqjGRZ+2IuO/SStj0EeXXoOfJL5uqfhTZWz1cOC7y/JdLD2vlkKEbd4SbhRzlE41Qv6s7oc4=@vger.kernel.org
X-Gm-Message-State: APuU4Z/GLntdz1DwdV9kD1WIde0GNi6u5GJdFfE1EFdUnXQ5tieT4bih
	paLbjj/i5zSkpoHE8dWMkKbL0Ys9qcs1ks9nygcKJxtEQxLWhWhCuHb3
X-Gm-Gg: AYBFou1LSb0G45Yp3skk4RA5TDZJmcRbvp9yEmq4l0ra1EyVN4m2WuB3IeEITqI6TGQ
	MIHwZ7ZWkm7CJ/ec4ChYqfMwSwHiyso18NgAlDDu50LQhvk+4+0dgx+xhX1gEEWfsLpDFULcqRK
	jMjcr8R8uWCtOhwwqL4cNfyFX1t+nI86ZaDWB83q6S3sM+hJKvlFIWItu4tNH59cj8KUrQyu2Sm
	FsMhMGH07DyKbfj6nsdVWKRCEp61o6kzsA9VRfMWdT3YjvntCK1kDLemPcLvRdCjMneyZK/94Bu
	3h5mAXzaEyUCjgbsyh+I7h/3e4kRWpr+SW5OqeEQ69NDZtuhyEbm35df666v74VwPPdA0Qt2Daq
	l3V48V8rYfAjnLM0yLhDFIqelMOYy+AjXT9A9i7HY8r66s8cM1Y/9YYsMvV+t5v4GNPsU2mM/2f
	cXc1sjIQ+hfn0c9DWFts6KaQChO3ugweFuYRhbg5sG6I+MyeD7IDXvToCWTgXQaXfDbca+6DdQP
	DeSb6bVAuJf05twlIDrQBed9zAigdVmIPHRXayedhe2sJEkXMavgAKgYvyoz2JHdddb4MNREAyV
	IRZEUO+LRI2Z1q155PSvKAwh1JxvxjVVuWD/lEK8gyYTMGdBz2XD+t5pdh98Owkv4dA9loZRwU/
	ehJ119gaOvt9XXPir6tbXWNMc2RRPOQ==
X-Received: by 2002:a05:600d:82e2:b0:4a1:c27d:e1a8 with SMTP id 5b1f17b1804b1-4b55d7d7a2amr57882865e9.10.1793893063915;
        Thu, 05 Nov 2026 07:37:43 -0800 (PST)
Received: from andreayoga.localdomain ([151.43.242.194])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b56f5e59d3sm79741485e9.10.2026.11.05.07.37.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Nov 2026 07:37:43 -0800 (PST)
From: Andrea Parri <parri.andrea@gmail.com>
To: Tycho Andersen <tycho@kernel.org>
Cc: Andrea Parri <parri.andrea@gmail.com>,
	Kees Cook <kees@kernel.org>,
	Andy Lutomirski <luto@amacapital.net>,
	Will Drewry <wad@chromium.org>,
	Shuah Khan <shuah@kernel.org>,
	Christian Brauner <brauner@kernel.org>,
	Sargun Dhillon <sargun@sargun.me>,
	Hui Peng <benquike@gmail.com>,
	Bradley Morgan <brads@mainlining.org>,
	Cong Wang <cwang@multikernel.io>,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	bpf@vger.kernel.org
Subject: Re: [PATCH 1/4] seccomp: wake poll waiters after failed addfd send
Date: Thu,  5 Nov 2026 16:37:34 +0100
Message-ID: <20261105153735.5368-1-parri.andrea@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <autZ5kL0S5MkX_8l@tycho.pizza>
References: <20261104103736.71956-1-parri.andrea@gmail.com> <20261104103736.71956-2-parri.andrea@gmail.com> <autZ5kL0S5MkX_8l@tycho.pizza>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Wed, Nov 04, 2026 at 09:19:10AM -0700, Tycho Andersen wrote:
> Hm, don't we return success or failure from
> ioctl(SECCOMP_IOCTL_NOTIF_ADDFD) via kaddfd.ret in
> seccomp_notify_addfd()?
>
> I don't really understand why this is necessary unless you're ignoring
> the return value from that call.

Right, the issuing thread gets the error and can recover directly.  The
edge-triggered example demonstrates the missing wakeup, but does not
establish that a supervisor needs it to recover.

The wakeup matters for other waiters on the listener.  A thread or
process waiting for EPOLLOUT while another one issues the request can
see no EPOLLOUT while the request is pending, and nothing wakes it when
the failure moves the notification back to SENT.  seccomp_notify_recv()
wakes EPOLLOUT on its transition to SENT, so the two addfd paths are the
odd ones out.

I don't know of a supervisor that waits for EPOLLOUT from a thread other
than the one replying, so the motivation is to report EPOLLOUT
consistently when a notification becomes SENT again, not to fix a
reported hang.  I'll revise the changelogs to make that distinction
clear, and drop the stable tags from patches 1 and 2.

Thanks,
  Andrea
