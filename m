Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 345DA2367DF
	for <linux-kselftest@vger.kernel.org>; Thu,  2 Apr 2026 02:39:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775097547; cv=none; b=DB3Pr1THXBQKWq8QX3CfSfukl9XW0AIJS8clVmJsHKUXJqDsOWA9Md1g6HaKsdkUD0xO5wbWK9KxLk0n1Li79XeRKHQdOQJNZgu6gEF9GVQZBpYXZGsOthysqj9vSYPbduSevL9lR7CTLgzfmdkgJMsw4Km94gZgAu0d+wHzghg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775097547; c=relaxed/simple;
	bh=rP3OCwKh0lVTegcUNdRph1Tl7P92pvs/YeO+oqqsPqg=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 Mime-Version:Content-Type; b=bC5yECgwgh6Ub96t6+qmCIgDvVL0j84Mx0+jKfJ2WQwE01Y1TRxeQrq410yAIk93osT7E8vbpVfA6oeHEKgLP3I1pbE255GSnmpODNg+H3wNBoJ8cY2/QXOBPXDblAB3eWo4ocDlGyJ7QUvSpdW9rNVFQBQoFEb0Cu1Xu7+oe1o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rFGh+ujb; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rFGh+ujb"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-79ea87af213so23638657b3.0
        for <linux-kselftest@vger.kernel.org>; Wed, 01 Apr 2026 19:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775097545; x=1775702345; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=uzXpB61GlnOdnCfwmcSsuKY/d401ddyF51RX6eWxhuQ=;
        b=rFGh+ujb2vfrAEVU/jtuBVSoEroD/786ge030JK2hYecINol6gAekexavzdDeGjesZ
         gtFqLT87HBLDY7/Rr7sGkOCX0mrnISntki0gK8n+Aky2Zo0aR1F764+qitx6ZjH3tzVx
         GuYY/U3IplL6NVDEToPrd2uYAolUJokAJYiyiZ9ezR8bmN6ozPjXnE2YoxkCpTCMfCMk
         nKO04esbi8or8J4tTCc4cQdnZlYd7EPSeiIdx9uA6FA+5sPAv8WNOsWnnSflNCXUP2c+
         b+gqgImupVFS+SqJwQe5DL0ZOz/lt2AurRVxBbtMT0Frjnr0KNKLijdnoNhh32wsDqD9
         M4Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775097545; x=1775702345;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uzXpB61GlnOdnCfwmcSsuKY/d401ddyF51RX6eWxhuQ=;
        b=P6REHgsq7hPd0oIDJFgMZfFPkGUhtbPVcYQOSz/AE0S9KH1F3eD2ZwKhT6CxYUBgGX
         kssv4oVwyOZj+6VSTHd7azvY16kY6rX29dtR4oq3wI+19caNZwYTNjBoc2cyGdwG7Mzr
         KWxINuAk0XvuwQsMb7Z4fAlhvPu3Q/EFLm1JUTnI6VtbYKBcrF4vX63S513v3Ypu2zSi
         3anTJe3RinNlIbAWru6hA/YktCzjNvj45CbmwgCcrHTb5/J7TwP6ZSoNxGK/ApAF0lbK
         x4jk7byUXQJrQBqyVYKUia5jlR8Q2P07ygblm70KQMheTYl/7wfZflAIsM37/AEfP1+d
         31uQ==
X-Forwarded-Encrypted: i=1; AJvYcCUp3jKuqg4DYx2BBkdE3VxjUhDTN3HHFZ+z6ZimI6hxXT4g7UTlq0a+HOEigeHsvj7GOhOXkQ36ErVEsOoGM/o=@vger.kernel.org
X-Gm-Message-State: AOJu0YzZjWHajpVsh5FjV1jmB6KTTFcfpSeNY6yBp+8yay+kVhIGZb52
	diO5HHR69p3JDaWqVf3uasH5IwrSiHBilKa7gHKr60dM2l/Oij8LwaTS
X-Gm-Gg: AeBDiesEImt4PIAnyy5u80TADFEmnDpGxWSNUXkoRr8L6t0D4HCPBHRYuYK2yDDV0r/
	YmIXuZ7/FktlMfLcxEIj61kk/a+mJGEHJtFZ8r5obDZ4f0FVjJfkJtUZuHR2fynHuOsUZQ0W5kI
	7FrAot2axsH+jzHnYshSQu9EDfGoj1UnPMXJvUZ5J3y85dJEk/BpWdcU/PJL3fO0ItmImIMSXY2
	CMeKQaFAzF5MUAr0UkLv+P+iFBQ/LSUVcBW8++3cvkvySlUlV0vVSQrln7rDTyR5ESJaNYDQPJO
	hqbLwAD68g/dLE8d+YffODMX7zIm43qsKvKpoj94EdB5NPbxEB7CwH0Xi++Oi3zz446Vh/oWRz9
	2hdiLqeY4/4nIs64ZU4w+q3XOVibNMCv8Ax3coWGIKtOoM/osrDEyG+457JO75QEVOFbhX1RMGO
	3cUJ4fzKY6EEki7mguPyo4L84ENwxXR+46c1pzVFs1d3rrHBH5m4MKF5YOGTcVeLsekY8qbnAcf
	XmVmyL5gCxWMx0=
X-Received: by 2002:a05:690c:3481:b0:79a:b440:5c8d with SMTP id 00721157ae682-7a3bc302170mr5926717b3.11.1775097545266;
        Wed, 01 Apr 2026 19:39:05 -0700 (PDT)
Received: from gmail.com (180.134.85.34.bc.googleusercontent.com. [34.85.134.180])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7a370905079sm5509607b3.23.2026.04.01.19.39.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 19:39:04 -0700 (PDT)
Date: Wed, 01 Apr 2026 22:39:04 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Jakub Kicinski <kuba@kernel.org>, 
 Willem de Bruijn <willemdebruijn.kernel@gmail.com>
Cc: davem@davemloft.net, 
 netdev@vger.kernel.org, 
 edumazet@google.com, 
 pabeni@redhat.com, 
 andrew+netdev@lunn.ch, 
 horms@kernel.org, 
 shuah@kernel.org, 
 willemb@google.com, 
 petrm@nvidia.com, 
 anubhavsinggh@google.com, 
 richardbgobert@gmail.com, 
 linux-kselftest@vger.kernel.org
Message-ID: <willemdebruijn.kernel.123ec4c7f938c@gmail.com>
In-Reply-To: <20260401191030.23104696@kernel.org>
References: <20260401182625.372605-1-kuba@kernel.org>
 <20260401182625.372605-7-kuba@kernel.org>
 <willemdebruijn.kernel.14f444719030c@gmail.com>
 <20260401191030.23104696@kernel.org>
Subject: Re: [PATCH net-next 6/6] selftests: drv-net: gro: add a test for bad
 IPv4 csum
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Jakub Kicinski wrote:
> On Wed, 01 Apr 2026 20:28:46 -0400 Willem de Bruijn wrote:
> > >  	/* ip sub-tests - IPv4 only */
> > > +	} else if (strcmp(testname, "ip_csum") == 0) {
> > > +		correct_payload[0] = PAYLOAD_LEN;
> > > +		correct_payload[1] = PAYLOAD_LEN;
> > > +		printf("bad ip checksum doesn't coalesce: ");
> > > +		check_recv_pkts(rxfd, correct_payload, 2);  
> > 
> > This verifies that a packet with bad csum does not coalesce to a valid
> > packet. Perhaps too paranoid but, do you also want to test the reverse
> > case?
> 
> Will do, easy enough. Tho TBH I can't think of a case where this would
> matter. Bad csum pkt must bypass all GRO processing completely right?
> Because we don't want a corrupted packet to flush a valid session?
> Or you think some implementation may actually feed these packets into
> GRO to avoid waiting for a session timeout?

Interesting, I thought the opposite: this would flush an RSC context.
That's also how the OCP text is written: "An SO context closes if a
packet matches the flow, but not the other conditions." 

There's a slight subtlety when sending three packets p1, p2 and p3, of
which p2 has a corrupted checksum. If three consecutive payloads, then
if p2 bypasses GRO, the other two are not consecutive so will not
coalesce either. This is the likely case for a real bit flip in
transit. Only if p2 and p3 have the same seqno would p1 and p3
coalesce if p2 bypasses GRO. That would be a weird, possibly malicious
packet, which is not much different from other TCP injection attacks.
Which have more serious consequences than coalescing efficiency. 
