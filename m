Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 333D736DA14
	for <linux-kselftest@vger.kernel.org>; Mon, 18 May 2026 20:11:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.222.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779135103; cv=pass; b=I4iclYSEcQ+ZBDiT0P0WlJc9GVtd9/tqJMM9Aj4KTaw2UHWLQZLPn9iaJiMUNI4LI6UXPo9wvYtsq4JDuIN28DhW9kjKwGRyVG/6uBtBLNHaJ3kOfU9sm7NfTwdHdV/OA+JTUA78c3YZ0YhjInOmSyevrAvOEAMbnd9IQKx2oJk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779135103; c=relaxed/simple;
	bh=9IEqR/JAOjfFIJhebyvyH/SI7u/QxKnr1MWrLw5MrgA=;
	h=From:In-Reply-To:References:MIME-Version:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mEgEG2f0q6AOSkmwCHDadN1aEkgETJR6cpxClmldjPihkFp94h7xL2tiaJ78btqQ+nCal6uE1vD13sOxdqKsiAO2Lc0gc8Q1EqPMXHYh4TM45jFZrP+KmOlDvG8005TzIOeHf4WaNKID8enRncfvCXDXaGhwtemhce+lBL2Bfx0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=c52N6cjE; arc=pass smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="c52N6cjE"
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-95d0476492bso1822471241.2
        for <linux-kselftest@vger.kernel.org>; Mon, 18 May 2026 13:11:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779135101; cv=none;
        d=google.com; s=arc-20240605;
        b=GvINZsg92Um3Q32DJsBCJRVvBwV2YZbaYEMtpVttUNcvbjn3oCf3G0NhwZwrxWZLdg
         vxlIpVBRyxJMerkIWoCESJcDs+VNRQNXmBoylQiDGdkapD8NqRoP6OkBXlO4b3Sq49Br
         aN7nEG2P6XxGYhapHMmATQw0GCkij6i3LadYZ54t87ehfqXkxu98pyk5RWY43bPClpDW
         KfVf3hOjJneTkalvnz7CVwlYqix5F2GxEWoWhsG88Td2ZuLlwFhQzYngIBSO48M0DHH0
         CmljP1I25YQ0YcEHsn6sa9hOIXmCAV7zpLC7kiIqtDWh4ozCeKGVHLiBI2vArlwUjgLB
         Cwcg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:dkim-signature;
        bh=9IEqR/JAOjfFIJhebyvyH/SI7u/QxKnr1MWrLw5MrgA=;
        fh=5uU4mA+cP40VbT/KBWVegYYTdKKhX/SdDVl5CCV9qI4=;
        b=e2rYBv4B9eDjGofkhRYAxsaHYA1vbPoaJ6FOKg9BN0VNoF3gGouLWG0T95qBlUDtaF
         nq3B/cy8sQ4XvH5hqnMNpleSmrL+4MXpp2v/seO+atpE4ygtZp85Osnkuj8mWjhbyofr
         cpPUChFNtZE1E64d8WsOeI7uycSJg6GBx8gUjs4PbBJisdy4VkTLqvTY1r71HAqnj4Wb
         BjXYhEIq26gLcpixTxSmjBUExBYeukJ+SyJ4L3mPqhw55kAnjbiPjaPUiNzoqifntu5I
         hVgxN4Yc03JUq9nDkz08aRTtnG2iQkgJBZzoq+L7sLnudmW/wefRCppQLdhmm944aoJm
         dxmg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1779135101; x=1779739901; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=9IEqR/JAOjfFIJhebyvyH/SI7u/QxKnr1MWrLw5MrgA=;
        b=c52N6cjEaqEYeVIKFaWdAtF1aoscZkAHsH7UTL1abmzqtAI5aSjYbquA6Wj2wy5jEX
         VkWE2LH6tf1nycM393ndpIQ1gjPb6cr2pCmkmhPQXyVngRAbpUx4kys30VJcctcbFmqB
         9H9xw2h+zGsmIrYX4qfobr+4iE3S4epXjj6IrzL8uk5q6Cjadr03ZXtocNRurR30gOPf
         oGZN5J/mXd0N3AquoegKHQvfw503ciDn6h5RiqDLi2fVYz3B9S9Qsa9iKA4n41kRa5nQ
         VgIvyAiPkzggIDbe6UadcvGEh1JM7tUmqCUve+oF21wgHjmnpX2Pq/hHs69J+xRfhFss
         LDKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779135101; x=1779739901;
        h=cc:to:subject:message-id:date:mime-version:references:in-reply-to
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9IEqR/JAOjfFIJhebyvyH/SI7u/QxKnr1MWrLw5MrgA=;
        b=iS+3LMZlWKJf1U6sMzZoD1pwd0Ih27veU3ndnz6JzFOmJpm6Vq8PpNiH9il/FX47cV
         zsH2//Uv9m9zceVgsYXRaPwRmz5BH93OVk1FZB2xnW1qhHP+uh3TbvMGwdqzkqvv6KKT
         RD1S5fyXZV8W+HvG415VGOXDrPHPFb080LFow8iwwmpjEpFZZlNPJFTUf67LQeJNzk1H
         xVVw8jbIfmMJAY+q9bTuoa2r7gI5RyalDXVpsFy2Yj6mKOxFAPiHRRKDbPbYZvh6/NJ6
         Y9XBlhihuhL9Sa8wEv8z2i+8TG+WtiIKbSzwnGVeeIHRmUldAlE0gQaNpbAGkV/9XTtX
         kicg==
X-Forwarded-Encrypted: i=1; AFNElJ8o+c8o8XFs6o1B/XvVtbAn73NJGbqdjty61dCRFdiOYGSYcefkTKXm5ncyRcEBEeRANkAU9mvyjWcZki/Yids=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDJL29ftJRjVeJnuBE94gEWLEeUTf/BUCmvjzpG4YUzaDMRLch
	dpcJBzSHKFtnE0LsZuPc4xEW2PwY+knO/tFlbDPZjtZzF4z1Cre1/FTqeDNJTsMg8TMhZFwWQR6
	0WbL0l8yuRAMSdycsQWZr+IVdAcTo0HAs5pdkQLpv
X-Gm-Gg: Acq92OHqY8Bxc25LA4wnFIHlxj0LKsDh1pdO/5h0e2vt7Dk+Y145TrLKeB1Gacz/lbL
	Z97c9HUv4gbKbnlUVqz5vul2T+RCncxTLPfEDtdV5aogWA1/3NhAv2u5MQao+bGL9TVRaAELMLK
	YwD89BPm9RhgC/wUUe/H5aQEJN6nfiWPOO50hepSfwry3I/cTrUayMoXEVRNk3JPYfcAI2JC8aM
	D3dQFE611eNjGRq+ik5BWmNJGupl5JYke3G59TAVl2l8N/IaJ6lGWyfrnsoArb7zuDjDqVuKY00
	uvCwCyycjML6i52Ian/b/EPzGvepWv83K5J4gfDw1R585LxF38yt5P68N+sCusea9ASadCwcOvt
	NISn+
X-Received: by 2002:a05:6102:942:b0:631:ec2d:12bd with SMTP id
 ada2fe7eead31-63a3cd10ed4mr8833063137.5.1779135100510; Mon, 18 May 2026
 13:11:40 -0700 (PDT)
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 18 May 2026 13:11:39 -0700
Received: from 176938342045 named unknown by gmailapi.google.com with
 HTTPREST; Mon, 18 May 2026 13:11:39 -0700
From: Ackerley Tng <ackerleytng@google.com>
In-Reply-To: <20260518070943.2091287-2-ZongYao.Chen@linux.alibaba.com>
References: <20260518070943.2091287-1-ZongYao.Chen@linux.alibaba.com> <20260518070943.2091287-2-ZongYao.Chen@linux.alibaba.com>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Mon, 18 May 2026 13:11:39 -0700
X-Gm-Features: AVHnY4LMAx_y1X0yC87kI7cNrem7WpKVKfwQkhpaYZq-kTqwoEkCuoNA5KTDNNw
Message-ID: <CAEvNRgF3ow+k74tnQQ0rZQM9jfUMObap36G=HuxG9Yt2E+z0Zg@mail.gmail.com>
Subject: Re: [PATCH 1/2] KVM: guest_memfd: Return -EEXIST for overlapping bindings
To: ZongYao.Chen@linux.alibaba.com, Paolo Bonzini <pbonzini@redhat.com>, 
	kvm@vger.kernel.org
Cc: Shuah Khan <shuah@kernel.org>, Sean Christopherson <seanjc@google.com>, 
	"Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>, Chao Peng <chao.p.peng@linux.intel.com>, 
	Xiaoyao Li <xiaoyao.li@intel.com>, Tianjia Zhang <tianjia.zhang@linux.alibaba.com>, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

ZongYao.Chen@linux.alibaba.com writes:

Reviewed-by: Ackerley Tng <ackerleytng@google.com>
Tested-by: Ackerley Tng <ackerleytng@google.com>
