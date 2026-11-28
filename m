Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795890474;
	b=G5N86UyvE32qpJvS5gUbxW3TKxeSv+MsZaTLtB1+7/XgzEa5fMvNhgKFkrfde+W/XeR/
	 1U6AihfE2GjlF5Jt08xNU1BooYsadbOMfR8Q3WFNZUDdi6QYAWUvfbPZT9awGnYPaqxZ3
	 DqmJWEHK1TM4NOCAd1mFZCKbGo0GWYX+dK9ngRssPFb93wbzGQkiw2UxzynX4VZdXB+Mt
	 9YWQ9u/VuXihZTc2RoYNwDCr5NhTRypFrjKtmeKEVwMu33Gg1IwLqQ02xgpitkSKkJgpQ
	 s36nYcBT89dMUGQr24E5fGKu3FhCVZCE6P6E9aOMYZmfe/RxBbSA1m4/Ers+3DFtV5A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795890474;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:Message-ID:
	 MIME-Version:Content-Type:Content-Disposition:User-Agent;
	bh=PW6VqNGtt0Xn7Z9rDv8x1cEDI/qhpG4GN81tYMe/l/E=;
	b=t1SOx9X3UJhX4b0+6Ntni/WHYhlCxHwNgai0MdXSjBnG+UT/KXY/u/zebCahKKm54l6+
	 EkySmGd2yNbxG/ZGfg3ajGVPh8/+7yFu7jCKjrOVJuFZleZINGRAPRHacqB6ySy2g7SQl
	 h3IyoMApCSf7NQYioSO1fq2ctXLUGgccUx8Bed8D5DOsBi8DqNMdXCJMVPU++gzCGsig7
	 2yP+X4TI6SpqQKvqoZERj3cVD6FRdQG/ZV2shESbfxhqDTLTp+qX9opTaylVh+slp+/Dd
	 wYIamO3Ni2riCt4uI8aPyxrp6FbaTKJnfYeEUX0ELStaI3cgR1D1fkc3PfQoMI5uyKg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=i5ph78qm;
	arc=none smtp.remote-ip=209.85.128.169
Received: from mail-yw1-f169.google.com (mail-yw1-f169.google.com [209.85.128.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EB8A606A6BC
	for <linux-kselftest@vger.kernel.org>; Sat, 28 Nov 2026 18:27:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3EB8A606A6BC
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=i5ph78qm
Received: by mail-yw1-f169.google.com with SMTP id 00721157ae682-8b595601695so14466387b3.3
        for <linux-kselftest@vger.kernel.org>; Sat, 28 Nov 2026 10:27:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1795890473; x=1796495273; darn=vger.kernel.org;
        h=user-agent:content-disposition:content-type:mime-version:message-id
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=PW6VqNGtt0Xn7Z9rDv8x1cEDI/qhpG4GN81tYMe/l/E=;
        b=i5ph78qmR6TS4lDtiPa/uEWjxLt7/sYnXoM8P4ugjRid3t+og6xxwR5T7r9B3WJBlu
         qVIjeYvpPsRCpyvSImvNGhvs0oy15P3XvItx2HsaBqdNkBDzPQlBLEAoScg4dFJpEcCD
         HELWeMDHrOmbKAhaSHblth7pbaJlLfrozG0oY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795890473; x=1796495273;
        h=user-agent:content-disposition:content-type:mime-version:message-id
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=PW6VqNGtt0Xn7Z9rDv8x1cEDI/qhpG4GN81tYMe/l/E=;
        b=ZNgnuHpiGKrP/yuS1FkgU8CQK3aGl94f0dOowth7b9TAqaM/Xbb3Ca6W1LOq3/ILGa
         1Hi21fkX+LJFOwLzp83/Qa8cqJ6pD84XocVlJPC12ra4mntxERQIuORl0d0OjhgUzdLE
         gigmO2QqMoGtdRtHvnvouFCED8hxrR8YKFokY93QloCnFrCRkY243aBICKldRfx+BXN8
         b0PI7zmj/PcA7YQKY/t98kcF9v6LJYN+565KYknvSTRW+xdCAI60W8rGxYafstkSHFH8
         T0ODdfjIoUbscsg9xFQsbayiQMwOkbkC/9LHgEz0DFJnMO+8/HGlhuvuTwajRZkpbsbd
         wyjg==
X-Forwarded-Encrypted: i=1; AL+hErFJDvC6cOj1/7KMGmJRBPCRlRRNcvhCbyjjTtefiviGbNvTteQs1spZdpbNv9MVYCKQRMdqCkULuQA8RP6Oadw=@vger.kernel.org
X-Gm-Message-State: APuU4Z9oS1t/XpJ4ZJZZ57YwjWzEcaCwm1Gqt0xngRlfXg6x+mLlD3Hk
	8MT3y9qXRRWn8af90CKbVTRNGMqRto2Hh+aClxaRTgMn3sX+P5AwC4TEpyQT5GP0KK0=
X-Gm-Gg: AZFdTZdkUiGwE963Htrb6nRHVx6VFYo0w9IIJpvF7hAiUUJnrvFeM9HxZoQe7nGuQqU
	78nWOQSjK1Yk42wpnWwqnXyKeIM6IgSNEQ/Q51M/2FEGC5BlhC+zmKj2fQfKE1IaWZZ+94WWt4P
	gV1PX/BxF6TQWefvrvDK+aJl0IzbtueOb39KZFb8SZ1Za4Z0DVkygzRKQeKZZ8HaQEseugTyhUY
	3LluWZvLI7XwOKydhzNxyKe3jhVkIXQpH/x40CEJOA31lmb5+bcsvoGvx+fzYbnCzXA6kksIn8Q
	ko6GLTRhOKi1BUOsT8jhJSS7IgmMMzpXx+yGksoXCSq2VbrzYuXcRDanQ/E91GRv693WItQhZ5s
	Bj8EaaJ0M0kWhrMy1I8yvKCP5/xwlXOY+6ezMYUQer6QKvNb5hApYSDHH+eMWA0qFFCBj2PkycB
	mfVH3K5XQQPTFlD+j0jcn3+QYkERWur00B6mJrtfphzR9HplplnWC6fRTAZeCqNLZxhJjbo+B8J
	88Y1zSWF6+mg47+xBxAx60dN9tPvh6K0CTzIbQ6PggGowLZSdLqT5jCrE2cFEdmwogws62yWX1e
	IgN9DqDJb3mUDPIgFY44ChFr7trIIFxXAfwkPfx5Rc3Q6jw4255fgYis4sNNmqSMc2ZhmAX0D2+
	/UiVLDn/j0rzwZvUhALWsjsfcoCqvmHEPZbmn0l6TZ7MbtaxCT6rEtEZNN3V5lOyyntQpAOpoEF
	hSGp9cuG4s4Hctl9H4UEh/N4ttTwAB1TcWVV8sdjKf4kwhP5g9GOLq2PkyPpY5FO/g7FOjtmwaI
	1NlT5JgCymQSRgaRsg1/7o=
X-Received: by 2002:a05:690c:6213:b0:8b4:dd2b:10dd with SMTP id 00721157ae682-8b52050f0demr78249287b3.64.1795890473377;
        Sat, 28 Nov 2026 10:27:53 -0800 (PST)
Received: from [172.20.0.3] (c-73-207-185-9.hsd1.ga.comcast.net. [73.207.185.9])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8b5202f90casm107671227b3.28.2026.11.28.10.27.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 10:27:52 -0800 (PST)
Date: Sat, 28 Nov 2026 10:27:51 -0800
From: Chris Down <chris@chrisdown.name>
To: Pratyush Yadav <pratyush@kernel.org>
Cc: Pasha Tatashin <pasha.tatashin@soleen.com>,
	Mike Rapoport <rppt@kernel.org>, Alexander Graf <graf@amazon.com>,
	Baoquan He <baoquan.he@linux.dev>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, kexec@lists.infradead.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH 2/9] kho: Make bootmem reservations visible to fleet
	monitoring
In-Reply-To: <2vxz4id3wgu7.fsf@kernel.org>
References: <cover.1794383544.git.chris@chrisdown.name>
	<c41c639fc5f453d60a265ba42a233f2ea5b48319.1794383544.git.chris@chrisdown.name>
	<179443886218.2329176.10742245280418377061.b4-review@b4>
	<20261113003059.056dd036a6546756@chrisdown.name>
	<2vxz4id3wgu7.fsf@kernel.org>
Message-ID: <awsdJ3sKM6Kq28Yi@chrisdown.name>
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Hi Pratyush,

Pratyush Yadav writes:
>I have a internal bug assigned to me to fix this. It would be great if
>you could fix it for me. I'd owe you a beer ;-)

Deal :-) I'll send it separately from this series.

>Is it really that hard for your collector to sum up the areas. I don't
>mind this change since it is in debugfs and very simple, but I'm curious
>if you really need it.

No, summing them is easy. The point in v1 was that the collector wouldn't
need debugfs at all, and once the total is in debugfs next to bootmem_len,
all it saves is a loop. I'll drop this patch and its selftest from v2, and
we can come back to it once bootmem has settled down enough for sysfs.

Thanks!

Chris
