Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B146285CBA
	for <linux-kselftest@vger.kernel.org>; Fri, 22 May 2026 07:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779435033; cv=none; b=GMw7hImar3iQzRMcWuJtU3p6zMacw9Q9zZ9YfTmS+uFK+aA7MfB2JfmeO3VIT/CAsHQ6JEwXeDwAl8v9aLVdTPfP16VczJSPdEQgKfzSuhxGVCaD/nO6E+Qs6n9exY3ucqJxFzJr4ezbAtb8U6mL23BXIVaReQC5yLYRVJNcAl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779435033; c=relaxed/simple;
	bh=+G+WcX8gxWotuoCjkWfQjS1KdGm+dPlBcgAAenlIkCc=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JUoHl27C3bKqT3axXgy/YqaGVXrBQVs3cE+jWdQoKyJFH1ZiaNsOdthIlrp+NHc52EUJo4sb2FyCcCBJdgTLAGuQHZhpfVcNBK0pV5f6+h2pxqrEzn1bd+SJEGJ2O51Uq4fRaM3TJanjSyYnNQq9hi5jL4y0vyfMye0Rr/ky+VU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com; spf=pass smtp.mailfrom=6wind.com; dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.b=V3/jtv+Y; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=6wind.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.b="V3/jtv+Y"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-44b729aa7c5so718150f8f.2
        for <linux-kselftest@vger.kernel.org>; Fri, 22 May 2026 00:30:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=6wind.com; s=google; t=1779435029; x=1780039829; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :from:references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=0RAn0u96GfobFXECWbhYR+PuAZ1QauCj0CfUQ4vS80s=;
        b=V3/jtv+YfDczYAzhpeSy/rTRhfKa0MAh15DAx+/WAMFcgGhPM+PsSoZHqiiTA6n/3u
         H0Ol0iST0ut5u4l5IwjerB9tQU0+3FaDHcSJDUyLQv2Rg6PFXNs/pEuEmucZ3m/r8qp+
         bttFB53iaKfuV9rlz5VDiKV3BQ6UjXqq0C6N+Z7WoQVR1hueCt/HZFRtPzlgrZPZjiRr
         Ki86SSBPPDcTTomPS/MgAZkJjyT2/14a3livrhJUF35Mmyt1Fven6m4AiXJi9IvE5ron
         uzcGpRY2QsOGRZw7JK5dGCgCwCZfmUnrkX2ZaKa9Fcolc4yUhGdjyG2hF7MR+zJjYyL/
         I5Ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779435029; x=1780039829;
        h=content-transfer-encoding:in-reply-to:organization:content-language
         :from:references:cc:to:subject:reply-to:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=0RAn0u96GfobFXECWbhYR+PuAZ1QauCj0CfUQ4vS80s=;
        b=rVZDL5pazdGbfK8rEDiV6D4sXn3ulbVDae+Qjfs7oRQXIqPTveXDn/5JVJtNcsQLnR
         eUcIeReViyXO7sUWc9cYA/lrx0EBNcCsBCkSnhCfpD/cigoEwJJLXfZn5DPi7mJJUQ7s
         0wK2c04PYRCo6fRVS/YJc6AZsilbiKJPH624NFRSasqrd7ZqfbNFL8MY9HGOmghhA3Gd
         l7IAf5KSdmAih3fEdn1kS0F8C8HstDdlNCjm2HRn3GygJGTUdzxuf9uLZZRklb25aZZB
         U/oCEpxG5VtjqDibAGO+CFBk7UdedZ8fRhOuFbmFRZ4IVKUP8t3fzlhymUz7LttYGABB
         PcyA==
X-Forwarded-Encrypted: i=1; AFNElJ/GTccKjyjIfgDmllQWi3LhmZnjUIsQo06UFPPjjOgbV7BTb/YYNKm/ixfWiUwJ1e8f1v0Ij6KMi0rW4mi/0xM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx6sg0fxTRjH4BEUfuNHqS9eWbm/MkPpCGFig404+2jMwmtfV2l
	mIMjJ8gngv6ZmQ5RGtH5+geLytoqaI/ijtwCf/pV3fuwDs5W7joTDpIhEOz0qkat5GA=
X-Gm-Gg: Acq92OG02GnAnOo2bUY+dACCqb2i5AdBwVxNhbxo+MfAJfHTV2xLtasIixJgfyR7hR3
	H3oBMOqytuDfs0+0ZqfMCEc8//CRKzDx0H7TEiWq9qy3zupadLJsm4kgwDso1zqOjZjnWx4BsRn
	HtVPXhGdbE2Loxb4lsO7RWmOfpzM9d3BHKrdLqmmOnoM+/BlElavER49JhUFIhXDz/slmIIpefa
	hu/LmB0FQbTFkxptwE2yV8sDRD2SG17B6itW7zyjDHioQEA/bp9Q40jUBI4JUkuF5YFn2ldBwXW
	/0dsVl0R8/bGOe05suAbZ0tJlmzaJwAvFsUo1Xhqf9HuvLXl6tOucpItKGBnA3Yx/C2IK5oNrUx
	6LnXFPJgiiqf7/Yqknf4xPTyfI4hXwlMUt9ow4Wi23HyjCAWoEyR3bJ8THDEJu58tMmJrOP+YfH
	u8JoTHt71oxWGHDpTW6HuDYedeAhOUkgITuIZG4ThvFWeQMIPcKbNVft13m6Tj9PiflN05Z/5S3
	I4E
X-Received: by 2002:a5d:59c4:0:b0:452:9709:40c5 with SMTP id ffacd0b85a97d-45eb369c6a7mr1253907f8f.1.1779435028832;
        Fri, 22 May 2026 00:30:28 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:ab7:2110:6a1d:efff:fe52:1959? ([2a01:e0a:ab7:2110:6a1d:efff:fe52:1959])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6c9de2dsm1893580f8f.4.2026.05.22.00.30.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 22 May 2026 00:30:28 -0700 (PDT)
Message-ID: <5231354d-cf31-4b47-81a9-823644e648a5@6wind.com>
Date: Fri, 22 May 2026 09:30:27 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: nicolas.dichtel@6wind.com
Subject: Re: [PATCH net v2 4/4] selftests: net: add a test case for nsid in
 all nsid notifications
To: Ilya Maximets <i.maximets@ovn.org>, netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Simon Horman <horms@kernel.org>,
 Donald Hunter <donald.hunter@gmail.com>, Shuah Khan <shuah@kernel.org>,
 Kuniyuki Iwashima <kuniyu@google.com>, Kees Cook <kees@kernel.org>,
 Adrian Moreno <amorenoz@redhat.com>, Jiri Benc <jbenc@redhat.com>,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 Matteo Perin <matteo.perin@canonical.com>
References: <20260520172317.175168-1-i.maximets@ovn.org>
 <20260520172317.175168-5-i.maximets@ovn.org>
From: Nicolas Dichtel <nicolas.dichtel@6wind.com>
Content-Language: en-US
Organization: 6WIND
In-Reply-To: <20260520172317.175168-5-i.maximets@ovn.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Le 20/05/2026 à 19:22, Ilya Maximets a écrit :
> The test subscribes to link events from all namespaces and makes
> sure that local events do not carry NSID in their ancillary data
> (even if there is a self-referential NSID allocated for the local
> namespace), and remote events do.
> 
> Assisted-by: OpenCode:claude-opus-4.6
> Signed-off-by: Ilya Maximets <i.maximets@ovn.org>
Acked-by: Nicolas Dichtel <nicolas.dichtel@6wind.com>

