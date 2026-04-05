Received: from mail-yw1-f173.google.com (mail-yw1-f173.google.com [209.85.128.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B5EC27380A
	for <linux-kselftest@vger.kernel.org>; Sun,  5 Apr 2026 03:04:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775358258; cv=none; b=du4F5LVTCohlq9gR0jm4ZEjeGth49/T7hFBFSqgqRPMvPuD/aHeGCxVjSVzQdW4e1YZz3l7yTVq6+EIweqHiGxNa2D+LsUGcwZG0UrotRfMotdqsCHCkmiJDrX7KGph8V/kNHiSrmurNqyYEWIUDFzDQLtLEbglme4Vcznc7tuo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775358258; c=relaxed/simple;
	bh=yEEngp7KMalharel9krZjkWbN0/Aha54Mek6b7Gatgs=;
	h=Date:From:To:Cc:Message-ID:In-Reply-To:References:Subject:
	 Mime-Version:Content-Type; b=Lwqi2zNprmoT6S4kE+Swlj7qL0vbqapnvUZZgUqQmjdKoG1XmoKZ3xzVXGxAVz9iJKJ+eHHnUeAfZr7swgcZVRyVroNU0B64TQkLwcHojuum7dZDZgdFMmqYxYJFKBgd5UTeVjM70e8wOE+ZlMrVH6wFibmAVJlElIKh7mIcUk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Vr+1Iwjo; arc=none smtp.client-ip=209.85.128.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vr+1Iwjo"
Received: by mail-yw1-f173.google.com with SMTP id 00721157ae682-793fdbb8d3aso29549487b3.3
        for <linux-kselftest@vger.kernel.org>; Sat, 04 Apr 2026 20:04:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775358256; x=1775963056; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pUZgKANrOkAQxf/MKhOniIP53GJxYrHO6dhJcPyazRk=;
        b=Vr+1IwjoN6QHsxtJjlUtZXUfbZDDAxb52rttzn2VGzvGLkcyCc9ynrvaUUhYXIM+NX
         oHnfiAYsR2uBCnVqSy1w/RPzbM/qvYIW0b5355qkVYxfmAYed3WyoSfx/iN1xp+4VEw4
         H/aNvLME0Dn0qIV6XtuufieUQfq6nfN071FW/YdpXVkjMR5ckarRCQTrzA5MVjXhh3I0
         xIO4HISjF8lWlsKq9MskU1/w0R9N1kH2GM4PJ/56PnWrke10zM0ALBwh4NmhF1wRhaI3
         5YxMr3QIvdpp8Rj2iTqTbyQJg3rkqfLGfQTKzFPlQiFa5TcZgf+PH6N5+659HAbF+B+5
         wfyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775358256; x=1775963056;
        h=content-transfer-encoding:mime-version:subject:references
         :in-reply-to:message-id:cc:to:from:date:x-gm-gg:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=pUZgKANrOkAQxf/MKhOniIP53GJxYrHO6dhJcPyazRk=;
        b=MJs8wI/mBk1Hkwd18HLbEJ8aI2QaXl34FHzSCqrXS+0lzkrgvhqWiC18ZIGkJywK9U
         Jo8IQliFh45kk1BL45otvlOqTBU3BmJH/dFVYJ1L84CnijyUN8WO1/X1KMdKt/ddHh/i
         tHjx9HWGhPvxNzi2fzlIXrJvxqG+UZmqM+OM1EwAALaZZEeh8d15VLY6UN0l/jE7yPWK
         CNvBonBkvnxsL94cLwCjgyglr8anhPjeZtyhVAGEXaUU2Dj0ETZZvfG3x6iXKnLGB41x
         2+Xx2hTO+1Uf45GmMvNInoZpHgh2wMOxUunY7rJbvK4LI1y4xS4M1Khw6PNMEujkn9ds
         rgZA==
X-Forwarded-Encrypted: i=1; AJvYcCVqEc0AE8T4NkQ7YQmE6GPbRSwOYq9D++tzgzWqV8ehH9nvKWaFQBgTs4KFKfCflSF4JahVMDELk+eX1WF9x/Q=@vger.kernel.org
X-Gm-Message-State: AOJu0YyxQ2kYHMhtGX/S4bMvH/AKTqD/13acmnludpP3mUWWRbA0ONqk
	FEI+0ZAvQgYacNyEW5pFea2owKJndONL1k+IFVhNAfYF3sbS6SxvKLJf
X-Gm-Gg: AeBDietklOwGkAN2HvjOJ6X/uNwlfZw6Bb8jD9uCQQEoPdiejjxiHyE+hs+iSonSYsn
	2aJ25PFFXoZr4H5mNlbtAXGWIa/+XzA5M4Usvibt7vpdCrumB3d72hP8lOXxPtdyCK0ZCi5PqlH
	hGsMf5WZvzI+r/GVj6mW1bZZclQKgQ7iF7Nru41uVvklcwLkwtLwseV31FuvXrfK60UzqFaYfMh
	ZGwaFxtYvuSM3iZIPoX4qazwjUWRfyhFgp9bXs2ZvjDakH192+BGVXNYYqrSgJB16cWVfOzQon3
	6+LhPrLhIDALxfTKMvSjiZKGwungOSQ8YeWEnfNingN86NlW/gp0qB+vZ2ns2WLsUD2VzeteLSh
	zJDZKeYJ8QGabRIc1mdJG0qu/ON+pDqO+fv6WSJvtdSzg41C/3uHHV96r7tkXLwXp2g8begblyP
	AGWmDd44eX6o8Pxpnbi/lQ7OeDTv9gtUcaDaCxrLgGvRHXT6dq5vPHNmle5rOrFTyYjtS5QYf85
	A3j
X-Received: by 2002:a05:690c:c183:b0:79a:c40d:b73b with SMTP id 00721157ae682-7a4d604f231mr71869457b3.46.1775358256085;
        Sat, 04 Apr 2026 20:04:16 -0700 (PDT)
Received: from gmail.com (172.165.85.34.bc.googleusercontent.com. [34.85.165.172])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-7a370901513sm38076957b3.29.2026.04.04.20.04.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 04 Apr 2026 20:04:15 -0700 (PDT)
Date: Sat, 04 Apr 2026 23:04:15 -0400
From: Willem de Bruijn <willemdebruijn.kernel@gmail.com>
To: Joe Damato <joe@dama.to>, 
 netdev@vger.kernel.org, 
 "David S. Miller" <davem@davemloft.net>, 
 Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, 
 Paolo Abeni <pabeni@redhat.com>, 
 Simon Horman <horms@kernel.org>, 
 Shuah Khan <shuah@kernel.org>
Cc: andrew+netdev@lunn.ch, 
 linux-kernel@vger.kernel.org, 
 willemb@google.com, 
 Joe Damato <joe@dama.to>, 
 linux-kselftest@vger.kernel.org
Message-ID: <willemdebruijn.kernel.400d24decd7d@gmail.com>
In-Reply-To: <20260403233240.178948-4-joe@dama.to>
References: <20260403233240.178948-1-joe@dama.to>
 <20260403233240.178948-4-joe@dama.to>
Subject: Re: [net-next v2 3/3] selftests/net: Test PACKET_AUXDATA
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: 7bit

Joe Damato wrote:
> Extend the packet socket selftest, adding a recvmsg path, to test
> PACKET_AUXDATA. Check basic attributes of tpacket_auxdata.
> 
> Signed-off-by: Joe Damato <joe@dama.to>
> ---
>  tools/testing/selftests/net/psock_snd.c  | 67 ++++++++++++++++++++++--
>  tools/testing/selftests/net/psock_snd.sh |  5 ++
>  2 files changed, 67 insertions(+), 5 deletions(-)
> 
> v2:
>   - Add is_psock bool argument to do_rx.
>   - Factor out aux data check into its own function for readability.
> 
> diff --git a/tools/testing/selftests/net/psock_snd.c b/tools/testing/selftests/net/psock_snd.c
> index 81096df5cffc..5464317c1764 100644
> --- a/tools/testing/selftests/net/psock_snd.c
> +++ b/tools/testing/selftests/net/psock_snd.c
> @@ -40,6 +40,7 @@ static bool	cfg_use_qdisc_bypass;
>  static bool	cfg_use_vlan;
>  static bool	cfg_use_vnet;
>  static bool	cfg_drop;
> +static bool	cfg_aux_data;
>  
>  static char	*cfg_ifname = "lo";
>  static int	cfg_mtu	= 1500;
> @@ -279,11 +280,54 @@ static int setup_rx(void)
>  	return fd;
>  }
>  
> -static void do_rx(int fd, int expected_len, char *expected)
> +static void check_aux_data(struct cmsghdr *cmsg, int expected_len)
>  {
> +	struct tpacket_auxdata *adata;
> +
> +	if (!cmsg)
> +		error(1, 0, "auxdata null");
> +
> +	if (cmsg->cmsg_level != SOL_PACKET)
> +		error(1, 0, "cmsg_level != SOL_PACKET");
> +
> +	if (cmsg->cmsg_type != PACKET_AUXDATA)
> +		error(1, 0, "cmsg_type != PACKET_AUXDATA");
> +
> +	adata = (struct tpacket_auxdata *)CMSG_DATA(cmsg);

Sashiko had another interesting observation that this access may be
unaligned, as cmsg_buf[1024] has 1-byte alignment.

That is not new in this patch. Indeed most tests in this dir just
deference msg_control as struct cmsghdr * and CMSG_DATA as whatever
domain specific type.

The man page also warns about this and suggests using memcpy to
access CMSG_DATA. Not sure why it does not warn about the other
cmsg_.. fields.

Indeed I can trigger this, e.g., with ipv6_flowlabel.c with

-       char control[CMSG_SPACE(sizeof(flowlabel))] = {0};
+       char control[1 + CMSG_SPACE(sizeof(flowlabel))] = {0};

-               cm = (void *)control;
+               cm = (void *)control + 1;

and compiling with -fsanitize=alignment. That triggers warnings for
all fields, starting from cmsg_len on line 78.

In practice this does not cause issues, because the compiler appears
to align char[] to 16B, even though __alignof__(control) shows 1. This
seems true for x86_64, but I am not aware that it is true across all
archs, especially those that cannot handle unaligned access.

I think the x86_64 source is the AMD64 ABI Draft, e.g., v 0.99.6

   An array uses the same alignment as its elements, except that
   a local or global array variable of length at least 16 bytes
   or a C99 variable-length array variable always has alignment
   of at least 16 bytes(4)

   (4) The alignment requirement allows the use of SSE instructions
   when operating on the array. [..]

Makes sense as sizeof struct cmsghdr == 16.

cmsg_len has length 8 (size_t). We'll be hardpressed to find a
CMSG_DATA example with a larger alignment requirement. Indeed I did
not in this directory. So satisfying 8-byte alignment for msg_control
will suffice for all tests in this directory.

Unless we're certain that 8B alignment for stack aligned char[] is
guaranteed across platforms, one safe approach it to add explicit
alignment:

-       char control[CMSG_SPACE(sizeof(flowlabel))] = {0};
+       char control[CMSG_SPACE(sizeof(flowlabel))] __attribute__((aligned(8))) = {0};

I can update the (other) tests. Unless someone knows that this is
indeed not needed in practice on any platform.

> +
> +	if (adata->tp_net != ETH_HLEN)
> +		error(1, 0, "cmsg tp_net != ETH_HLEN");
> +
> +	if (adata->tp_len != expected_len)
> +		error(1, 0, "cmsg tp_len != %u", expected_len);
> +
> +	if (adata->tp_snaplen != expected_len)
> +		error(1, 0, "cmsg tp_snaplen != %u", expected_len);
> +}
> +
> +static void do_rx(int fd, int expected_len, char *expected, bool is_psock)
> +{
> +	bool aux = is_psock && cfg_aux_data;
> +	char cmsg_buf[1024] = {};
> +	struct msghdr msg = {};
> +	struct iovec iov[1];
>  	int ret;
>  
> -	ret = recv(fd, rbuf, sizeof(rbuf), 0);
> +	if (aux) {
> +		iov[0].iov_base = rbuf;
> +		iov[0].iov_len = sizeof(rbuf);
> +
> +		msg.msg_iov = iov;
> +		msg.msg_iovlen = 1;
> +
> +		msg.msg_control = cmsg_buf;
> +		msg.msg_controllen = sizeof(cmsg_buf);
> +
> +		ret = recvmsg(fd, &msg, 0);
> +	} else {
> +		ret = recv(fd, rbuf, sizeof(rbuf), 0);
> +	}
> +
