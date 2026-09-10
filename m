Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6CFBD3F7A83
	for <linux-kselftest@vger.kernel.org>; Thu, 10 Sep 2026 09:48:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789033685; cv=none; b=XzvWdtytyGaCqBNgblpPRiFWSn35kWU+PFzCSETJPDbnI4s+ud/yhLH/1SWNLirXT86WwjY3VJjlq2j96b8it3QaM4aI69baXTegucWXp4mc9U6gtxK8OTKsYll7EsM7MewpjKSYU76n9SZiIvqKKFnpoXx/SQRWa4WzCsvH8/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789033685; c=relaxed/simple;
	bh=QYuOBm2CqLdlM7TrFTz39mvN4Ht6QnmssFnzzfnloyM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sdHgfjTMlkedD2fctIQucCiXqtDJ1c9/BArC8Cgj3ydc9B9Q7Z+9BH38VDu94m+X/aZm2AsKg0LMqGua8Vrr21KAhg+/UF+pFiEuKA+PhKT2dWF5x55kU9F2RHprHS1eN3ykRdtcWZ5vsbP9u44f/w/LVcNDzMzxWnGyxNGJbak=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fEDYeGOR; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=M8aFjA1B; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fEDYeGOR";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="M8aFjA1B"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1789033682;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=I6SGvSRdswv+E4pXtxp1ASKfEHGRGHA0m8GCzf8rxt4=;
	b=fEDYeGORJcyPmzosqo7dL+K+SYUQOycJCi2mGhKHaYZSU6GoSD9H+W+twrDnXeMAbj/lXH
	/pm32T3uG35jsUuf1dyqc4YftOqUx3cfNB9+yvHvDM4lQNR29dHUivI/YuOIpYZlw6Zx6T
	Qo1TY1OTyPSuAiEfI8UHWJF9z0DG9xw=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-470-MHsWJRlKNLGv6AfuJprSLw-1; Thu, 10 Sep 2026 05:48:01 -0400
X-MC-Unique: MHsWJRlKNLGv6AfuJprSLw-1
X-Mimecast-MFC-AGG-ID: MHsWJRlKNLGv6AfuJprSLw_1789033680
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-49cf4cc2125so35142605e9.2
        for <linux-kselftest@vger.kernel.org>; Thu, 10 Sep 2026 02:48:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1789033680; x=1789638480; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=I6SGvSRdswv+E4pXtxp1ASKfEHGRGHA0m8GCzf8rxt4=;
        b=M8aFjA1B0TudiHPCHaOUepKwm7vECszlrZqExzCEWQMGguJ+HVYuxhnH1Y2ufaw+/u
         uCVRvSNl8JRsSh0J4bINs5RL5creeOtpgEaPyEXZtKDS5xlLVbc9yb/NrteihQ/XqeyN
         56vCnwHbSfs0ZJep5ZCMZWRZt06//6ex1ifz5JEZ7vkJv27DaRxS4M6ymziUpaY26LLs
         MVteymX3iVjDey7olfWCF9F62dsYzXFkxbjZzSwkxjKROf4l6VWts3yJ0QmTOZr+jUJn
         p0dcv2sG734hT2SodwDfns4aY33u0KzXMu8FEzV4/z7QFjeq3J8BOdyZHaD4IjqN+sZR
         0/1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789033680; x=1789638480;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=I6SGvSRdswv+E4pXtxp1ASKfEHGRGHA0m8GCzf8rxt4=;
        b=M7seJ2jMEziM+wxPFz3OXKlXIgqxRUN9T2ByOzn7lLDdboofFakU6hgZsuEM7xyXwT
         KXdyMau/6tEPfjZ3/t+RLTh4icPIQ4DN4bWKGveoCANmK31jmJLuBVJV0Hxev+sMwodV
         XP8c76/XKb//L1n1K1kWblrjIPnVc8uOo3cpYJ5H0vf73yVawX68vUtbVkFRGe5zFPzu
         jAdTDvAccVMvQg7amNMr1HIiFzwCGKO+3Pi3aK/E3nTrD+wENnZKvOgRcT5vW9JPcjtH
         5Rru9ThOjSKXdYvMOjjksau5E7OnKu8aYveKddRJwyVJUZqPUAq5Pp/3+nPoPx04+XnF
         BqhA==
X-Forwarded-Encrypted: i=1; AKwUvBzc7fUzEbaM58vKTCUnJqTgG+iBFvhhHJFFAI/2DFeHY3T0E8doAf56GJ0ZYNisIWCBw330dVUDomeHRHRLeFA=@vger.kernel.org
X-Gm-Message-State: AFuF++nyJ6aNOaymkOME/aCvdSIF66aiQSgTA1wYsFquqU1Zfs33AlG+
	0teNn0SBOvpxJ4wlXZFr/NsflnyZw4DBNyPfuQ7LXZI7oosHr1qKLZhJJ+87vNhsQJ6/OHOL81/
	Z8BsTscH/iBmHz/yUSvIljwwSrhKU6ns2xKBldWQwuCPG291QENtTlg87A8bz1I5muTIyPQ==
X-Gm-Gg: AYBFou13Hixp2+DK6zV6lTXBDrdRBgBR52zjaMJ1K+qh9QrNzeZ0nE3eBC2soXeWmKu
	4MLAXjB6423zSLjBT9lqPpHHIcEdMxDHPWHayboaAA48WIrTpZf1B7Equ4IRjkjH1na42VwSwLT
	WM1/u67qpD4n1YZSXDw9OTHwwMTT3BnM+vhlMf/zeoPc+30SKGWAhkYSW35PUWQMoIYI7NK+nGf
	agzVTqTco3YvfKZ7eg3tiI+olyUX8nKWmX8Y3yXMIJ93sZlBLvY6qdbAFk6JAE53p5/Zfv0De0j
	fw8UaiMmeeDqBXtyN/zgTL7tbGq6WX4cl176ijTRIMHMvLZpeUAp+diWkvyzW85m33H/Rc2tfW3
	86VwGfNBBJ0wnRYVuASTPhpyzvviOZV8DocqW+SQMASsaidMA/hSVrvCyxe44RGQSKnNT2vXY9A
	==
X-Received: by 2002:a05:600c:b93:b0:499:8174:9f39 with SMTP id 5b1f17b1804b1-49d1f0af3d1mr167199155e9.0.1789033679811;
        Thu, 10 Sep 2026 02:47:59 -0700 (PDT)
X-Received: by 2002:a05:600c:b93:b0:499:8174:9f39 with SMTP id 5b1f17b1804b1-49d1f0af3d1mr167198445e9.0.1789033679428;
        Thu, 10 Sep 2026 02:47:59 -0700 (PDT)
Received: from [192.168.188.218] (ip232-47-231-195.pool-bba.aruba.it. [195.231.47.232])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49d26c2985dsm113481895e9.6.2026.09.10.02.47.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Sep 2026 02:47:58 -0700 (PDT)
Message-ID: <9a4f9408-bcf8-430f-adc8-f69c771f333b@redhat.com>
Date: Thu, 10 Sep 2026 11:47:57 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3] selftests/bpf: Track test_xdp_features DUT
 processes
To: Bochao Cao <bochaolucky@gmail.com>, Daniel Borkmann
 <daniel@iogearbox.net>, Jakub Kicinski <kuba@kernel.org>
Cc: =?UTF-8?Q?Alexis_Lothor=C3=A9?= <alexis.lothore@bootlin.com>,
 Emil Tsalapatis <emil@etsalapatis.com>, Lorenzo Bianconi
 <lorenzo@kernel.org>, Shuah Khan <shuah@kernel.org>, bpf@vger.kernel.org,
 netdev@vger.kernel.org, linux-kselftest@vger.kernel.org
References: <20260904-xdp-dut-process-lifecycle-gmail-v3-1-5b7eee4f7009@gmail.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20260904-xdp-dut-process-lifecycle-gmail-v3-1-5b7eee4f7009@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 9/4/26 6:44 AM, Bochao Cao wrote:
> test_xdp_features.sh waits for any xdp_features listener to appear and
> uses pidof during cleanup. A concurrent test can therefore make another
> test proceed before its own DUT is ready, and cleanup kills every
> xdp_features process on the host. The readiness loop also has no timeout,
> so a DUT that exits before listening leaves the test hung indefinitely.
> 
> Track one active DUT at a time, wait for ss to report that exact PID with
> a bounded retry loop, and reap it after each test. Consult the shell job
> table before signaling the DUT so a stale PID cannot target an unrelated
> process. On failure, terminate the shell job with SIGKILL and reap it so
> blocked I/O cannot hang cleanup. Install an EXIT trap and signal handlers
> so failure paths also remove network setup.
> 
> Fixes: 4dba3e7852b7 ("selftests/bpf: introduce XDP compliance test tool")
> Signed-off-by: Bochao Cao <bochaolucky@gmail.com>
> Reviewed-by: Emil Tsalapatis <emil@etsalapatis.com>
Since the goal of targeting net-next is allowing shorted turn-over for
the conversion to driver/hw, I think it would be better to include the
latter change in the same series.

Also it would be possibly make sense to take care of the last sashiko
comment (about signal handling).

/P

