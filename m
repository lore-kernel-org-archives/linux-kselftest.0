Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2F021391E5D
	for <linux-kselftest@vger.kernel.org>; Tue, 10 Mar 2026 22:34:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773182083; cv=none; b=poQWxCPfRTutbfjAXzZ8pLxJx8IJd2Rcq6PUGtc/FNbuUerK+0yMjIz3PbwuvnBY0zSdL4laYGM+KyBdZsJ6yVirZQAdWHcCZBLe7/SdDFlJYGZB++l+pahJ9MsJFw1K0WdDmX501Dl0ywx6MpzglhLA3abNO2TwDg2EoMrPsOg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773182083; c=relaxed/simple;
	bh=gA1+6V/KieO2PhMuLUC9X+yRGVh4ZS5XyQKNHLvoAmE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cD9p0d15gCrheABNbXrVRLy2U68QfSxekUOEpQw3ga+xRxxsgS1EPtq23klU2FtrwBm/jttQYsdcv9QaPxX4UQTsXynVU9kBPP8xWVBnaQAdfQ2MlLRnNMoaDsLK8xOBDQfYuCOKVXgdMpmbpxh5OT1l+NmjY7JCnzVD/8l9YJs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lxC2lXFK; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lxC2lXFK"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-48539cbb7b1so19695055e9.3
        for <linux-kselftest@vger.kernel.org>; Tue, 10 Mar 2026 15:34:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773182081; x=1773786881; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=gXU4YewdIeXEw5CIQLJ4hSfe0f5ekUOc0dg0Lb4JccA=;
        b=lxC2lXFKmikseA3TsZfT4NIQsK7xWAcFkKW6J+HU6f2PT3X4CBsQezAGCyWm9gFA6U
         TiBJYbaJnI22lwBBBmNzXhzDx/IMiwrNmyy5uROFPdM1/3fJC9ejwHcBfTGy7PoUjmDW
         Ec8NyWghX7iis/PLFwjHXLPJb5DeNvcJnzp/gPq81KQNdCLVkEO+uQT8DiifUq6kPxc6
         PZaMJzw1+anMtAsCEoat+wkGd8ntDu/rwfU6A0qlaAsU3VFOWnXb1vIl9t8KLHyM/B42
         EnvUMtIw4o0hm0vMSffj4H8k6JYZ7vJIKxLyh1gMcc7jyOA+9wlI2I37BqvTjT96ZoFE
         4nng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773182081; x=1773786881;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gXU4YewdIeXEw5CIQLJ4hSfe0f5ekUOc0dg0Lb4JccA=;
        b=G/hK9EkjRTVd6ArGmAlSvBW1LUGz/QdyMUkly2LP6PJ+FF1TbjD5Q6/bMKMP8SXrQz
         VMMjhDaCKocRaUfDKkEQhL14VUsGPcurh011dsyfSqoxfastH7siNPhZpavdFuIEF59m
         1tJmtUhHAfeqVSgoIpCZCGDYZhwajk6+5Vza3g4U3oq/wvS4xM5RrOPlxgROfgrAzGvq
         eJliEdws3OodOahZRemf83sYD1GoPQr0k48wArseLtxcpnzhfW2WXAe9ua66RKbo8FxW
         +9s2peFcNUK/kTDwnXVY5Mv2+4s7ZO3wC9nqGN9ywlv6sYisZKi8lbJwS5VBlpqJ3Hi5
         zXAA==
X-Forwarded-Encrypted: i=1; AJvYcCWwGLq2llC0X+1qYvKa9qVeH4Fj+CLNlWHiHrQI+IoVVJh2idVvEfOEeOBAOzWxn+F2DFSllWvv+IsJCppqjGg=@vger.kernel.org
X-Gm-Message-State: AOJu0YzJ7qoAjGkmA3bnmK9MmPNDAUc/0m67lPDRej83Oe7XGjFciP8Y
	0rBrPaBzjGIlmLPHMAcSg2SXopOoYbHiisXx2c5poPKWhvm88ZdoB5N4
X-Gm-Gg: ATEYQzzj+PHrYUIsL8m3oT/Ymff93kU+kFoNrjB3BIV4cJIHvfMilQAMLviLw6wFZ4v
	Ze9zCVedFxQhI3HXIrAvDp245565CXpiYFdN4n8wg/r3EKrhOMZFlsBjIoWdPSPNJOCK5nVoTYB
	B/RavJthMlRwWsT9oroZ+HDyP0F89dTJcjYWKdl1kxTBOhPBhOeXHFXmy7HokX54H/CEZNldx/Z
	Cql+7Nps7GqsPcmE/1azp59mKE/gC7ZNb6S5EQ9zUoh+cGKmvlX9L8MtPRZoxX3NRxXj0INjhVA
	xIGnKNZmZAHIiepypY2Q7sys3y7Hoajq+iGZfDvUOW8qSi26Z9aPz9R+CdyjUB7/aGuLaKWxay3
	N8pn3BOKWZTNWIuEVYnSfR0mV4gFFVHFRGaCfnbBN3WUcU+H1logr69FrKhWkmND8P0S0msHblU
	ewUzrDVRap8eEaQlMphXVXtlFbwfP0ecwWkDCPyKiA6GEEIW/eZ8OAw+CMgvxS5VGkWTXOx0QgB
	T/C2uIUAmzJaT+NpTjOTKY=
X-Received: by 2002:a05:600c:1f8e:b0:47e:e076:c7a5 with SMTP id 5b1f17b1804b1-4854b0ca217mr8508535e9.11.1773182080137;
        Tue, 10 Mar 2026 15:34:40 -0700 (PDT)
Received: from gandalf.schnuecks.de (p200300c14f1996009e6b00fffe39b8a7.dip0.t-ipconnect.de. [2003:c1:4f19:9600:9e6b:ff:fe39:b8a7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4854a307bc4sm7973655e9.3.2026.03.10.15.34.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 15:34:39 -0700 (PDT)
Received: by gandalf.schnuecks.de (Postfix, from userid 500)
	id 21673302C729; Tue, 10 Mar 2026 23:34:39 +0100 (CET)
Date: Tue, 10 Mar 2026 23:34:39 +0100
From: Simon Baatz <gmbnomis@gmail.com>
To: Stefano Brivio <sbrivio@redhat.com>
Cc: Simon Baatz via B4 Relay <devnull+gmbnomis.gmail.com@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Neal Cardwell <ncardwell@google.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	David Ahern <dsahern@kernel.org>, Jon Maloy <jmaloy@redhat.com>,
	Jason Xing <kerneljasonxing@gmail.com>, mfreemon@cloudflare.com,
	Shuah Khan <shuah@kernel.org>, Matthieu Baerts <matttbe@kernel.org>,
	Mat Martineau <martineau@kernel.org>,
	Geliang Tang <geliang@kernel.org>, netdev@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org, mptcp@lists.linux.dev
Subject: Re: [PATCH net-next v3 1/6] tcp: implement RFC 7323 window
 retraction receiver requirements
Message-ID: <abCcf1opVAr8CvpL@gandalf.schnuecks.de>
References: <20260309-tcp_rfc7323_retract_wnd_rfc-v3-0-4c7f96b1ec69@gmail.com>
 <20260309-tcp_rfc7323_retract_wnd_rfc-v3-1-4c7f96b1ec69@gmail.com>
 <20260310095806.121d198f@elisabeth>
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260310095806.121d198f@elisabeth>

Hi Stefano,

On Tue, Mar 10, 2026 at 09:58:07AM +0100, Stefano Brivio wrote:
> Simon,
> 
> On Mon, 09 Mar 2026 09:02:26 +0100
> Simon Baatz via B4 Relay <devnull+gmbnomis.gmail.com@kernel.org> wrote:
> 
> > [...]
> >
> > diff --git a/include/linux/tcp.h b/include/linux/tcp.h
> > index f72eef31fa23cc584f2f0cefacdc35cae43aa52d..73aa2e0ccd1d7a6314a00c27950b019b62a3851c 100644
> > --- a/include/linux/tcp.h
> > +++ b/include/linux/tcp.h
> > @@ -316,6 +316,9 @@ struct tcp_sock {
> >  					*/
> >  	u32	app_limited;	/* limited until "delivered" reaches this val */
> >  	u32	rcv_wnd;	/* Current receiver window		*/
> > +	u32	rcv_mwnd_seq;	/* Maximum window sequence number (RFC 7323,
> > +				 * section 2.4, receiver requirements)
> > +				 */
> 
> I didn't follow the rest of the discussion but, at this point, what
> does this mean for applications (CRIU, passt) dumping/restoring socket
> data? Do they have to adapt? I couldn't find this bit of information
> anywhere in v3.

Based on our discussion, the "Setting the TCP_REPAIR_WINDOW socket
option initializes rcv_mwnd_seq" v2 change addresses TCP window
restoration.  As we said that information about window retraction is
not crucial, the window will be restored as "non-retracted", matching
prior behavior.  Therefore, there is no change to the information
that applications need to dump or restore.

-- 
Simon Baatz <gmbnomis@gmail.com>
