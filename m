Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93FC119EED3
	for <linux-kselftest@vger.kernel.org>; Thu,  2 Apr 2026 02:26:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775096784; cv=pass; b=QwH7j4/nqPZApAKnpIO0jMo/jWC6WiHGA7ibiDUeJdYyKQOXMWMHeSZ/mlogDBK6AZWEgvI0r+XSJs9EbYm4tjaZpNd0X4BG/Wzvd7MHDK0l7heicdKHq+IuG2V3QwvT7MM9xrQ9Xo+SrPZ1tXAx7hdCl86mSaq1JgpE6tDOCto=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775096784; c=relaxed/simple;
	bh=tWl3PMbY8WSVMBe70id0QojUsUjc22+YUzk3cAiXrqI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PyvY8a0BzsTpnQvWow4x+fINC9dkg6pcMNQbjXd2e0V74drnV3PWNVT3HEiqWi+HjT+WMHQjmvtBLFR+lY4YfnLAg/rjL9hjkkThmhJBnd4EYYL//6j7nrgtLqEpaKNWK1GT93VdTcIDJnRpJiI3f8DO4qIIDp2A6QNurVVUsiA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=p4aFogyf; arc=pass smtp.client-ip=209.85.128.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="p4aFogyf"
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-79be0de8610so3619277b3.2
        for <linux-kselftest@vger.kernel.org>; Wed, 01 Apr 2026 19:26:23 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775096782; cv=none;
        d=google.com; s=arc-20240605;
        b=dbvyZVWSz4r3WuWnlBekEjm4x5U4Zg4i+XKOIOC3e85v3V9Jwe9yiV4OuTRF5SyOOC
         Ya/+kMYT0EvW0fg5irWdBGbQn7hGAAFD6dJq6zXZs5luev0EOkAQmZMZgXbONgizQ2E8
         Up795Q8aYX+U0gLWRgwW2+aj/DdRancdQRoKmofcGkjfhlpnrmMrRmXGOSGG298bVclN
         kFLrVzZZzzqMfCWvi29EyDjcPcx8+VDNuT6o3/tZQ6f36UvNWOJ4ZGOrK6ROwRDjtEfh
         2egKO20TZky075RdNcjaZnc5njNveaH6IN89ebYJ9Ihy2U2XwJT6G8qGDI6PWK+fYN93
         yh6w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jbcLxyNKssJ/qsojKtaGf1w4cEtkGVy5OnWNXj+J5+I=;
        fh=XuEX+ckyPYvMDYgbmAckIXZ3+RmnIwGOoc4ejL9+0Lk=;
        b=MHAeocqMQkAMm07twPe1qYVUL4KkL3BGefESBdMVBR1nbZCwNkOuKBHOD13OqUtmQa
         YgZBrIsEjbKp2H/EGhbjzBoGqkKpBzhqpErWlWx+VYMJC8PgNZ4q+5bTIFBlHnOCsYvi
         75agwOSbiiBRXr6h/o5fFbkOEsf9pP9DEHcCvjI6EhP2k6o7gVIyM2aQJMBOTQUbSTxe
         ngo/POTL5xSA1nPCvZgFDZF1UZg08hyV0EB+FTkqxAs6/lseLxGsXgCv3WOyDALXZviT
         Kv53FMK9Bq5WK+ETPV22PKiBQv5nUV8g07kjZndOIOM4VqU4yuriDAcL1U8YNlRNZfQV
         QeGg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775096782; x=1775701582; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jbcLxyNKssJ/qsojKtaGf1w4cEtkGVy5OnWNXj+J5+I=;
        b=p4aFogyfFr6le/lnlniUfRCoP7kFoelYDJjViX9zSJow1SN/7nRdsyh16+zn6tyTBC
         c3FnPv0hxAJkGyded0hKEK9fJ24TmzC2jSFUYpto2nLTOkvgodS2mJCYi/rjfDFHz1xT
         y2c/mrdkAI5qYvyOZM4/xvrnRnUH8otrnRrXAh4B3qMIeAIPDCFgD4WbhXDf5dB7VS1q
         4ZWmln7A4Ljxu5QGzYecl0r48R+ntnmblYHyFvdjgOocsRqrSJNYvzGJJYH4FaL13A81
         V8Tl6OY+vIPjrnjJuQGOeZWF5VmEcGrkleWaB9wtA0ix9Gr9sio7VQworo+nctlvWrFL
         jFcA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775096782; x=1775701582;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jbcLxyNKssJ/qsojKtaGf1w4cEtkGVy5OnWNXj+J5+I=;
        b=n2jCWPNPQWRT2D51xDI4V6PvGss8kh63fJIzZ/d6dBXE89LXG6QiUly6SrsejqNokr
         jIlvb6gI304uHD+PBNIWFMIg89zLjgjFU1DaZdaj69Hu8F49KA8mKIvJiHAZ2j9B0BQ0
         eSG1U5zJ6j43eWLc37NGG03mwxZsiqT9tdPGQYnLv6zCgr0hte071WLnRUP9pFhyk4gL
         ACSo9bUqSe/urf8hKWW/ntBW34NmQ0xUuK+xjfdxGijmBexfy/ilc2oZ7YJht+vLyoDS
         mhf05/jhvYaczjOs3QsXTYH+li71VTj8pDrtryzmc90ZTvF35fLhV/j07ozqA9KCyfaD
         Yfdg==
X-Forwarded-Encrypted: i=1; AJvYcCUFgfCNci9QtAvnWnCTD1NjzwngD2U3nfeGrFMDAobtDHg0l+Z5gS5LvYyttGoDAhGcl8Rpy5NPchtdZxcdM/4=@vger.kernel.org
X-Gm-Message-State: AOJu0YzB7xHAYGD+ZW67rafB4bnawpcQq+/bb4Z9oewP41e4f8cBpChh
	tB2HR4/HNXfqBkFq/sNxjBto7phK2wNi+GRVE/kkNuruqwxz+s5YQvgfh2dz/QbQQfvEkp6mkTD
	ERvmgQo6e/0nz+oOlIVHe8FIBub0p+EY=
X-Gm-Gg: AeBDieuVqPt6TfSxNpiV4qSqe5aTvzq78gh/zswHO8YLGm3eK8zCKINGf4QJUYCIarp
	uHx0bkGC1RfmL2oGeMVlcX/lVeOJNCMo5SSgEosjIqcxdOsr5fNwcU9bJTAwBWWxwEMpIxl41ND
	cU7FR8ER/1ehFpJeNhzrdxRct3+g6tKnyS8gyw2ugBguFMaOsTAxivIbK/1cKesiuL8OFjh9mDM
	UL4cUQZSUmpiE5I6RQfJdTOWqY1ExO6BeTeQ7ARtXbhxZlX8IJ7peykq+ZqZIzclUDJDIVEWUs0
	bYVuUMvVu3Cdh1dEeeQ9bhO4w54jgCyASpfRao3Q
X-Received: by 2002:a05:690c:13:b0:79a:5164:bb2b with SMTP id
 00721157ae682-7a20f6eec2bmr61155537b3.7.1775096782537; Wed, 01 Apr 2026
 19:26:22 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260330035604.133073-1-dqfext@gmail.com> <20260401081030.29b050d5@kernel.org>
 <CALW65jahWApDnVmFReW+Y3HDxBEmCwzsT1oyh03SW7X5ry6PzA@mail.gmail.com> <20260401175621.549c492e@kernel.org>
In-Reply-To: <20260401175621.549c492e@kernel.org>
From: Qingfang Deng <dqfext@gmail.com>
Date: Thu, 2 Apr 2026 10:26:11 +0800
X-Gm-Features: AQROBzCtPXGaDqROF8pKtII2foTv_tDo-gjdvN7lGgVfBU6XpEEcgXimHm6lXKs
Message-ID: <CALW65jaTbaosbO8ypKZ6G37HxuxXabeTaP_Fhq72xTovmDj+8g@mail.gmail.com>
Subject: Re: [PATCH net-next v7] selftests: net: add tests for PPP
To: Jakub Kicinski <kuba@kernel.org>, Dianne Skoll <dianne@skoll.ca>
Cc: Shuah Khan <shuah@kernel.org>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>, 
	Felix Maurer <fmaurer@redhat.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	"Matthieu Baerts (NGI0)" <matttbe@kernel.org>, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, linux-ppp@vger.kernel.org, 
	netdev@vger.kernel.org, Paul Mackerras <paulus@ozlabs.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Apr 2, 2026 at 8:56=E2=80=AFAM Jakub Kicinski <kuba@kernel.org> wro=
te:
>
> On Wed, 1 Apr 2026 23:45:38 +0800 Qingfang Deng wrote:
> > > # iperf3: error - unable to connect to server - server may have stopp=
ed running or use a different port, firewall issue, etc.: Network is unreac=
hable
> > > # TEST: PPPoE                                                        =
 [FAIL]
> > > not ok 1 selftests: net/ppp: pppoe.sh # exit=3D1
> >
> > It looks like pppoe-server fails to start. You may check the syslog to
> > see what's going on.
>
> Hm, we don't capture syslog automatically :S We capture stdout and
> stderr
>
> I'm not even sure there's something listening on syslog in virtme-ng
> Is it possible to make the daemon log to stdout or a file and dump
> that file to stdout on failure? Even if we fix the current issue
> it will be quite inconvenient if we have to go into syslog every time
> the test is failing. The test output should provide enough info to
> debug failures.

Add Cc: Dianne

I checked the man page of pppoe-server and did not find such option.
We can instead start our own listener and redirect the syslog to a
file or stdout:

socat -u UNIX-RECV:/dev/log,ignoreeof STDOUT &

Regards,
Qingfang
