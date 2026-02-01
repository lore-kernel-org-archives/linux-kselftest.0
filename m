Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3BC77286D70
	for <linux-kselftest@vger.kernel.org>; Sun,  1 Feb 2026 22:21:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769984515; cv=none; b=t+WXWdcBNx1A5t6/lQzm2jQ0WCShkE1CWUVfUipYvu+muZjIyhzUu9MjZiU+TPKadaqwH9zYQBYzudJ2KUpQ5epxFANdIaACbnCS+8xXo+VOa1PXmtk8MHYld+Vr4dlT0Oj0vSKJx7q8U9b6xVvaJ/nFDH3iJe0eKxurN4SvVXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769984515; c=relaxed/simple;
	bh=/50UstTYTe5qclwh6Uqp/GbNZAC9vdNY1YNsVLSBDY8=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 Mime-Version:Content-Type; b=Zse/68hZFbV+SBN/+NdAq+69kjn4dPWQnfdol9+/Qa1seO5OxAFUxhQabf12zPw09W0QIkmVDxzjhKN9QjYpVOE4vXxG6YI/pJj1tqUAmz3DCE1VuUep1/oQXbeiawQnnUTmVCc01SMSV/EPnRJeMBFGF5GWdqLkGsF1vnEwGKg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TN/J/dWZ; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TN/J/dWZ"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-794d3bba0ccso3103547b3.2
        for <linux-kselftest@vger.kernel.org>; Sun, 01 Feb 2026 14:21:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769984513; x=1770589313; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=92nSMhqZxV/o0GA4gQ9PG0AX7xo4zjcdqIMWnHaJQbk=;
        b=TN/J/dWZogGd2wynsNIgBoOhrA4c4Z4V6xciwiN2lHlR50UfiDcyUIktfbT+M36H3d
         evnal5zznseS1mhk8BFynONl+OjKLnPEO7/9UjI01+jC4sxJC+uOIOhCc8v5DxdGmQN+
         Jy6aig68SNPCb77+sX2gbnXNu0o+5I94QW8dfUvKDXFn4NbjPBtEoU/6tVPnuX5n+qAL
         alDTTUuct+3pJj6OCPk+gFIn93gMnwicvPJ6OZhlrsonYWms1OFAqY1CZiY6qlA6aaox
         gy0MBbUdZAlxvz3cHA/OVxbMrlN7BdNoP5OxiwXZeDIdGKSyaCctwCp3F+2OU5HGisgz
         JqVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769984513; x=1770589313;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=92nSMhqZxV/o0GA4gQ9PG0AX7xo4zjcdqIMWnHaJQbk=;
        b=dcTrnmoarL3zm3RvJ2O0QmtR6kCuqkIArPEUoqY//b97GrW3EwE1UhzyblC0heyw4e
         AqkB+za3l1/cxdbrbmrl/xkukHnUwaQSxESrhyYXFMGVcf/kWSoXpwaPh94/Sk/rM+Mb
         bfqkH3F9GhsLGxW7WKN6C3QxpBS6z02P7eHGNwC/Es9tjiE39WlKJLn4KulwG/id5lKT
         HbfFqM52HcPf1yJw/TJ3SGnRqvr+CO+vOgl8Q7WOUkRKIBr/3nf3QKdm2G7cMBKl3+2o
         9y5jTJHQGVtQRGIscPFfqY7I7SsDGhlkqPo3AIdn1uiEPbuOU0uXHYY2/B0MkMoDebH4
         EeUQ==
X-Forwarded-Encrypted: i=1; AJvYcCX4Xk6Y77KBfzbOygXFkCrFipE9YPLUpT1mMURhA+1V6gue7bMj/npXZwsAtjJG9SoD9WT6DxKGnra3UgZwRb0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzHTpXCVhbnCppsvkCvrchkQBgpca7IltMnecFgpWHvcpaIbmTn
	4zjnaVGkrtdSIzSdxaFFqbRXhwuPOrO5HUdpmHtYKCp5iT2ptwkA4OKZ
X-Gm-Gg: AZuq6aLCNLYQKODf7enzJWEfwQz5yIH9w3t/5uyyOYMmyJWccM6/gQeI+AuYrHOzeAY
	568J50O1W2X53jLt4hRbyPiHL53U70nwqczhtna20HUW21Ll+BIf0SEZ1Q/1Uzra6uLaMX5j4S0
	5ymEw5ISiIf6VuxNlRo4XtwhKtH/cowBzAe7GQrR9WiGljVccf8BSIdGXdiyNYOZdzCh7qF3QQW
	0XD37c4rBAaueqXG+OgWRZXysTSQ+UeM1+5alXU0MtSp+0U6siCOm4utioQsLFPX1diFk54NXoO
	hUCyxjZ2v8w21wbO0sj2Neq0gUPX77prn6uhaQzQ+6LSrw97bJEq0hVedGFqf/CPF0qJ2xzbsmy
	hUwb1/a6DhTsjvK/avkFN83oe3yjB1ETLOXGPE0QBWkQ8UrYvXb1o+s8OgLTHGhRXmKzyiancRT
	GAiWM4c/v/3hl9Yk8zvyYHdqYH7y2YlnQYiIXkRqcx6iXWzr17H1iCeKK2PkqKUJwG7z+v0g==
X-Received: by 2002:a05:690c:6a83:b0:794:8f0f:e8cd with SMTP id 00721157ae682-7949e077adfmr89832787b3.70.1769984513172;
        Sun, 01 Feb 2026 14:21:53 -0800 (PST)
Received: from gmail.com (21.33.48.34.bc.googleusercontent.com. [34.48.33.21])
        by smtp.gmail.com with UTF8SMTPSA id 00721157ae682-794a89fc966sm38096557b3.1.2026.02.01.14.21.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Feb 2026 14:21:52 -0800 (PST)
Date: Sun, 01 Feb 2026 17:21:51 -0500
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Paolo Abeni <pabeni@redhat.com>, 
 netdev@vger.kernel.org
Cc: "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Simon Horman <horms@kernel.org>, 
 Shuah Khan <shuah@kernel.org>, 
 Willem de Bruijn <willemb@google.com>, 
 Richard Gobert <richardbgobert@gmail.com>, 
 linux-kselftest@vger.kernel.org
Message-ID: <willemdebruijn.kernel.38507b06f982e@gmail.com>
In-Reply-To: <5a0fd9f22844611b806d1cc8bdfbe1504bb33b47.1769771825.git.pabeni@redhat.com>
References: <cover.1769771825.git.pabeni@redhat.com>
 <5a0fd9f22844611b806d1cc8bdfbe1504bb33b47.1769771825.git.pabeni@redhat.com>
Subject: Re: [PATCH net 1/2] net: gro: fix outer network offset
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Paolo Abeni wrote:
> The udp GRO complete stage assumes that all the packets inserted the RX
> have the `encapsulation` flag zeroed. Such assumption is not true, as a
> few H/W NICs can set such flag when H/W offloading the checksum for
> an UDP encapsulated traffic, the tun driver can inject GSO packets with
> UDP encapsulation and the problematic layout can also be created via
> a veth based setup.
> 
> Due to the above, in the problematic scenarios, udp4_gro_complete() uses
> the wrong network offset (inner instead of outer) to compute the outer
> UDP header pseudo checksum, leading to csum validation errors later on
> in packet processing.
> 
> Address the issue always clearing the encapsulation flag at GRO completion
> time. Such flag will be set again as needed for encapsulated packets by
> udp_gro_complete().
> 
> Fixes: 5ef31ea5d053 ("net: gro: fix udp bad offset in socket lookup by adding {inner_}network_offset to napi_gro_cb")
> Signed-off-by: Paolo Abeni <pabeni@redhat.com>

Reviewed-by: Willem de Bruijn <willemb@google.com> 
