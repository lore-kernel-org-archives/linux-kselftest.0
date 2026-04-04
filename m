Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 774FB21D3CC
	for <linux-kselftest@vger.kernel.org>; Sat,  4 Apr 2026 01:34:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775266442; cv=pass; b=R7KuCZe4aGfFCMfod6/t45JZIrObjFGE1X5oW9dBT/fhJ/RoKz3NyjFB865D1+J3yufDYYtS1bQeN5OYjA6Ta9Q59HJZZWFe+k7Oi8ZHaMLVpl6WsCpz1hnjxLWK4F9/XBWccaVYWY2aeboZjnBC6+AohitJeawhEKPKrngxZJs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775266442; c=relaxed/simple;
	bh=tACdfuNvuecVdLWS0HJWivNtfxvEwyjMHCX4AbXRuBo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cdLTb6RTaUm/jFKb0BarbsH7cm/2/EhlZc6p1jar4pROISrQVshrTW1IlJ0KxqCeeOEX+ksgOgXLnuJVMgthcGWp0o2FJExMtUGKxQSPeI1I1tWv0zUYNEg9WEtHIShsOWfK9SIwwia1ITst+iK0rF12mjcgFeSB5oNS7GrFEyY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=KMMPhGss; arc=pass smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="KMMPhGss"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-66ba6d3dab3so15916a12.0
        for <linux-kselftest@vger.kernel.org>; Fri, 03 Apr 2026 18:34:01 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775266440; cv=none;
        d=google.com; s=arc-20240605;
        b=HqceP63K4RYg4QEMB1T7LqQAkRV5wO+8vPHR/fuSb3lOH1UoQdBfqg+lmqPnu4A8Wd
         DihW9zLF/A52dedcG9/sdUcjd4TtA9maLF9aCFHP5seXSbnnvINAb8WyKGqBvP5OP9s2
         qy7hh2XAE6b7bpqn5jVDfLdVoskzY8m5l0lv4WD3KY8rdLQ+uyJ4v0piLLPgts5Trttn
         ivoTryUorMFq7NKtxd9YpLILy51+Nj38ziNVoWkErdW1YMn4qxwJuAqTIw9ELX0fXYuH
         2yetx2y61cPtYVyrndwaFzHFO6dsIUqYitp5eLFWFE0qEyZTMm3+s2qmcenhbDK/DFIT
         q9Pg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tACdfuNvuecVdLWS0HJWivNtfxvEwyjMHCX4AbXRuBo=;
        fh=2xUAf8jSaDLuxD0ZQIuvw1P1L+sw0d760KdsSXS81rk=;
        b=gp2rQP1+Q07gXOVCXW7SNeIiFQwb7nNMzSHnCXSFmmvS3tFcMFeNa7U7VWjT4yY+ec
         utts3XIY/rBQxg3ullcopLFFdE1mBCRgXR8DXZiVbcq+7wIMMJuZNa+5C2sy3Vg56yxR
         ozcVjiVKNBQqBUmgetb9HFREhbspWsxVYDfYue4+B6RebK0zy218qfYCs8zu0UHLYfnv
         P149tPT3N4EGMjDliuhdgP6cJBhvpYV1nkL5LAzGPDBElPtv8W4wrYc2QkZyx7SyfkLE
         jj1Qs1B6OhAzGZ3GBrfKPZBtK3srqS9pxIGRK1r7kiLrUzSfGinxJkwa8bGRZlMKMg1U
         7Rqg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1775266440; x=1775871240; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tACdfuNvuecVdLWS0HJWivNtfxvEwyjMHCX4AbXRuBo=;
        b=KMMPhGss9evwWTfp0uVDdTvVCAW8QA2DVFc0U65NWgxCMwNinxzMqu9UTa7DHpNpiz
         zd8WtzodUw4A8ppaS+1w+dcVgFxFswO6Vqftp2uobSgDGrlp3W/vT/aFPp/r2RmjE1pc
         s8RE0bT79R5TXcfxZw6JNPbHk3fRfnT0hOwDbqwGTVJ0zJnEgGQYRl9T+vOWXNKnDrDr
         +5YD9sxJsIO6KATqkk7XsE+7uWbmwDAZbZlfmL6le9Styyww2XraYuDaVdL93DvHxW9Q
         HLgZhtP9VOVBHK8qlP/DT+yrQyLji9PA1UcXXss7K6c+flZuV4HZ4+VkZslIVN1T/wg1
         hzGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775266440; x=1775871240;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tACdfuNvuecVdLWS0HJWivNtfxvEwyjMHCX4AbXRuBo=;
        b=piGEuyOXwfV6/mc7VMcxpK8ScodayU6a3MjuA9fZ4F7DsdAoDFd+Igp+H3by8J5rFs
         iVFtZxQVVDqAjG5HfxyzwN+IuqDHq8clwDxdTN3fJvhB6zY3ZQ+cfuaVBeYa1u7Sfe5q
         LKn/2Zf7jW11EMOhyvGOY9mfBg6Wu60QNY7c28f6J0OE8/MS/vlLrKjmcrr7SZoBG1aW
         zIQnRFJBHj7mKB5L4GrQx0/0up93VN1FDLyB7IhUOeIyaRRJ/rVA4FACG6IYppf3WyBA
         N+CCbUCEk6nZxsmmsfy/Vh2ThvreM/GLyrhMfC4MCBX1vAyhvUgM7zJX0Tw/e17BLBac
         j4nA==
X-Forwarded-Encrypted: i=1; AJvYcCUMExQH4C0rIGAUK00K02kaN/LaxIS5expgCyheOFG83WRdsSdTl5wW8fYdDaNkC75LEhN4kYKb8QKzdvN/SLI=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz9OjxhszqBsZMq1mMwYz2CMzA03Ls68iiZgu5Vyz2NtTq0R68d
	Hfx2wV8YoZwzCIDZWhR2TrIi6CBr6hm36GfQgyJNddQw/wUrJNKmdTNpSWDJxvXg1IWoMvK/H3f
	WCM5pcKgr0mRvxpXsfStftuZ7n1ICHOCcC9drO9Fk
X-Gm-Gg: AeBDieuXKX3DgaxcgLIYq08jkYocoH0TtH9/aqdBzEntEMXV7WFQMFIIUeGxXsfemmS
	+RYCm77Bj4kmeuKFEZxn83m8gUN1CzRnmLs/VwnWFdy82R2zlMpvTNb/ByxMQ57PCWhXJRkRrvY
	fHccV+XnLdIpUK0SDN/o7pbD6FKiLlcbtYWTHIhOkoKVbaM6bAPuzMlPlgne12sHZ4nM7ROHhY6
	2+2S9ds1vIp+QL3aqZ/CAiy2mRgby0ItV994saJ+jtH/bkVTiciojeu6rEEhfxmZhC2cwUU0d/W
	BSQWoiydtPscL952v1Cdp++Kg8uK185FOnXDtb0=
X-Received: by 2002:a05:6402:5345:10b0:66b:eb28:2779 with SMTP id
 4fb4d7f45d1cf-66e415a0e54mr43493a12.12.1775266439410; Fri, 03 Apr 2026
 18:33:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260403-teaming-driver-internal-v4-0-d3032f33ca25@google.com> <20260403123039.77c80266@kernel.org>
In-Reply-To: <20260403123039.77c80266@kernel.org>
From: Marc Harvey <marcharvey@google.com>
Date: Fri, 3 Apr 2026 18:33:48 -0700
X-Gm-Features: AQROBzCcDmh9vMwsBnfFw6XOXuPHROjL8aDLdAW0gvpf0c5E0VDu0J3cAY2ph0Y
Message-ID: <CANkEMgmh4_QtDum0brYNZOxJxzjeZpsxr8PMMKoKVBDawA6GXw@mail.gmail.com>
Subject: Re: [PATCH net-next v4 00/10] Decouple receive and transmit
 enablement in team driver
To: Jakub Kicinski <kuba@kernel.org>
Cc: Jiri Pirko <jiri@resnulli.us>, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>, Simon Horman <horms@kernel.org>, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Apr 3, 2026 at 12:30=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> The test seems flaky, we hit this twice in the last 24h:

Hmm it waits for the active port to change before checking the packet
counts, but that appears insufficient. I will make it wait for the
newly inactive link to stop receiving traffic, using a generous
polling timeout, which should fix this race condition.

> What's even worse the retry of the test then fails like this:

When starting up teamd, it seems to check for a pid file, which
persists after using sigkill on the previous test run. So if we don't
kill teamd gracefully, then this file must be deleted manually. It's
strange that it didn't cause any problems on my end, but I can fix it
in the next iteration.
