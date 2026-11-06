Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.222.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793991483;
	b=aW9TqaaEh7bV6aliM2zB8xSEaXGl1RLVctcl9O/sQPP4lXM4GzwJFpH967lXqy1frdpU
	 laWzS62da4r0dg0FgByx7V7h15R/Nlq9cuYtblCv6OslA+AN7w6/Ae/BwQK+48p/DeqCt
	 qBPxWzk3LHwy8SsQg0LhChLOtgM+29qK46YUibn7GRuj4kXsLRm7unFtVkqyW6TgjUFBQ
	 izcdgf94Y/NaZTvKEE9x+lOI5xT6kiwb+20jnX6f7iN//rndI6n4kK/1WH9gfqhhFWNSO
	 64+IL1dJwg9HEc8PaQqBy+zPC1qorbizZTMvFiG6N9fnCifQp7XCPsOXQbjOJer1heQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793991483;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=/MMk4dpDTUnL+JeGvHAKWol8stlyFONQgS4qXzOKLhA=;
	b=Tp889lx9SZPhgtoGkFfn7dBYa1lquFrvkKGRznv6wQtXuEbzoWvzLKtW0D9tie1eHDjk
	 GFSUnPyEZl4DV+xJZH/XVmHUAkRqvJErFC6Fh1XRiQbVFq/UeU7JLuuFZT39sUzSLm4oe
	 aDvOTo1MUQU9PVYE1EwPEjUee4edyM8DqKlXuNjkyz9ARN4PUuAEkt01359wne9hXx22v
	 FYnYwtserqYOFnv7jT4+xwzCmMP5uiChEXUeS3sVA0aoj7G0DC9TBCKPkSndOuSyNE/co
	 FE6xVpxfEYklw9E2oPICMiP12VukklB5p03roSVKL2SCguXX6B6XC3SUG9p9YcbItPg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g2dlm1z7;
	arc=none smtp.remote-ip=209.85.222.178
Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49C0A606A329
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Nov 2026 18:58:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 49C0A606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g2dlm1z7
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-93a40a9a01aso261842185a.0
        for <linux-kselftest@vger.kernel.org>; Fri, 06 Nov 2026 10:58:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793991481; x=1794596281; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/MMk4dpDTUnL+JeGvHAKWol8stlyFONQgS4qXzOKLhA=;
        b=g2dlm1z7R8dRmnPuJheXLtnTivnrhc+b2GrWjANEhjh9Ksp5Mr9TfeuOSWzqgp9kZz
         52cHo3yCTgNEqmD4dDy0mY7KMi64/zBtcjCerYQTcWedSg7ggnGF2oowk1AMZJIVRo6O
         2Qhg1pUHAtyWFMrib4mmJ0Mkc/RhcjTddE8NtA0q99cgq5Blq3A6oo2laEYQyKwNJUyQ
         547EOet4UgqoLGR7NjgVu7HEHpc0Vqp+tGr0lHMgrj9ndfUh0/BSEAQhHypbq3hvPcS6
         TWO0Lt6psS2GXpI9XZye69soOq9Nu9Y6Ywn/SQlSirhsK70U/sth30l7aamOOhDZga8+
         eE4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793991481; x=1794596281;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/MMk4dpDTUnL+JeGvHAKWol8stlyFONQgS4qXzOKLhA=;
        b=dhTgI4EMSgJhQptIqY6ET2vYzCg0uH9oYE5Ikg36NN2iB3rbT+zrB8r3MDpHAgC3y0
         aKaJQfXVNIEBWhruettof1gRzxd3Z4qbvcswidWPMLTQTMQ332UKU3Zypnf6SsYt16CQ
         yZggNsCqqi5nVcq3hktRl9+3sPS+XKsu9tQbUGCTDWpTIqd0hQgGo/+yfdj9fkfrTXbt
         eSeCWRqlSdReY/Wm7PT4UAxh3Nef/TvJUvUCKdUCRQ+F8SF7Ga5LNf9iCdfj6kTpWuJC
         O6BJV4tXtEQMOmOxZnkoXJsAkFR4LvgMWH4pYp7/JUdR/jZCuMV8tXsh3g68B5nwx+Lw
         474Q==
X-Forwarded-Encrypted: i=1; AKwUvByODHAP9djypj3qktVTo+gX1pgzkYA9XYbaKR4AoCB45PUtU+zewm2y1YiQkhnsmjXu5mLhE7sHw44IK6kJw/Y=@vger.kernel.org
X-Gm-Message-State: APuU4Z8udkTAFsdrzUikwd2ref8RnVe5okaEU9MnIJFXJmRbRk4BYUJi
	Y9J1GGWoaY3K1QsAGF//jT4JyGbMUHfiPQqCsfd3Tygec+NXe4p6u2nb
X-Gm-Gg: AYBFou0MNe3LiqxwpKpUvDf++bzH0dYhC/SBx5EMJpb5FOzpjXO2L3e0tqmhjwTUhC0
	CbvUgID52FK2ktKxkaUShQcJ+CEBirr6W8jtOxpmyGKbUaf8G7YERiUvJZmJ69vNtro293Xnwcw
	UcFgGVwjo8PwKVX3kbzdr7AVixPurFhSxL1SNKYN0VqucaPcrebGh5305TwZLs4X2KvCz0n75hZ
	kR/FI40nBIW+YjoRoCAv4GlKulGDp/8pMulojmhBoh9UojOtA1+L3uBDUG+z3plrOdYZJiAI99g
	9I0/5xR38b/tWPMFBNGKXJJQvINeVNk/jlAi1IyXOJjAh+Gp4UN+5wCNlMm3NAYolr6Xx8uYPmo
	MdarKGzeXx+KGYRD9+Wc1lINgiSQRoW8D4plmuAna/+yqA9B31k3AUD/zH3yOPXeaTzlinTmM5V
	kYPKctJ+/o1ixQZUZaQ6zWrwI8oMrHTqE6TYb8JO8sMcORM4tYx5s+dxemntv7MaNIY1Sf216Kj
	SPmonTvNXy9G9za/UD8KtiK9Ep8VbNKs765bYC3GquUyCZKpD2udYER93t64Msl+hfUI9z7xIyC
	C6nIc2DnZSvqnmUfhGupjAIhHTXwArgFncwq6A==
X-Received: by 2002:a05:620a:45a6:b0:93f:59b8:e29d with SMTP id af79cd13be357-945f3512c78mr506798085a.26.1793991480829;
        Fri, 06 Nov 2026 10:58:00 -0800 (PST)
Received: from localhost ([2620:10d:c091:500::5:81c8])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-945f599baa2sm207605985a.15.2026.11.06.10.57.59
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 10:57:59 -0800 (PST)
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Post: <mailto:linux-kselftest@vger.kernel.org>
List-Help: <mailto:linux-kselftest+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kselftest+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 06 Nov 2026 13:57:58 -0500
Message-Id: <DMOCWJTNK6BR.3AS3IC9QSWXTE@gmail.com>
Cc: "Simon Horman" <horms@kernel.org>, "Jakub Sitnicki"
 <jakub@cloudflare.com>, "Willem de Bruijn" <willemb@google.com>,
 <netdev@vger.kernel.org>, <linux-kselftest@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <bpf@vger.kernel.org>
Subject: Re: [PATCH net v3 2/2] selftests/net: psp: test bidirectional data
 transfer
From: "Daniel Zahka" <daniel.zahka@gmail.com>
To: "Daniel Zahka" <daniel.zahka@gmail.com>, "Wei Wang" <weiwan@google.com>,
 "David S . Miller" <davem@davemloft.net>, "Jakub Kicinski"
 <kuba@kernel.org>, "Paolo Abeni" <pabeni@redhat.com>, "Andrew Lunn"
 <andrew+netdev@lunn.ch>, "Shuah Khan" <shuah@kernel.org>
X-Mailer: aerc 0.21.0-threadmapfix
References: <20261106182007.374660-1-weiwan@google.com>
 <20261106182007.374660-3-weiwan@google.com>
 <DMOCEM7IQVOS.I2QH7FT8FT8S@gmail.com>
In-Reply-To: <DMOCEM7IQVOS.I2QH7FT8FT8S@gmail.com>

On Fri Nov 6, 2026 at 1:34 PM EST, Daniel Zahka wrote:
> On Fri Nov 6, 2026 at 1:20 PM EST, Wei Wang wrote:
>> _data_basic_send() and _data_basic_send_netkit_psp_assoc() currently
>> only verify unidirectional data transmission from the test socket to
>> psp_responder. As a result, they do not exercise the receive path for
>> PSP-encrypted TCP data segments arriving at the test socket (such as
>> packets redirected across a netkit interface associated via dev-assoc,
>> which relies on SKB_EXT_PSP surviving packet scrubbing).
>>
>> Use the existing "data echo" command in psp_responder to verify that the
>> test socket can also receive PSP-encrypted data from the peer in both
>> _data_basic_send() and _data_basic_send_netkit_psp_assoc().
>>
>> Signed-off-by: Wei Wang <weiwan@google.com>
>
> Reviewed-by: Daniel Zahka <daniel.zahka@gmail.com>
>
>> ---
>>  tools/testing/selftests/drivers/net/psp.py | 22 ++++++++++++++++++++++
>>  1 file changed, 22 insertions(+)
>>
>> diff --git a/tools/testing/selftests/drivers/net/psp.py b/tools/testing/=
selftests/drivers/net/psp.py
>> index 473500901879..c114d2245135 100755
>> --- a/tools/testing/selftests/drivers/net/psp.py
>> +++ b/tools/testing/selftests/drivers/net/psp.py
>> @@ -120,6 +120,26 @@ def _check_data_rx(cfg, exp_len):
>>      ksft_eq(read_len, exp_len)
>> =20
>> =20
>> +def _recv_careful(s, target, timeout=3D2):
>> +    """Read exactly target bytes, tolerating short reads"""
>> +    data =3D b''
>> +    end =3D time.monotonic() + timeout
>> +    while time.monotonic() < end:
>> +        try:
>> +            data +=3D s.recv(target - len(data), socket.MSG_DONTWAIT)
>> +            if len(data) =3D=3D target:
>> +                return data
>> +        except BlockingIOError:
>> +            time.sleep(0.001)
>> +    raise KsftFailEx(f"short read, got {len(data)} of {target} bytes")
>> +
>> +
>> +def _req_echo(cfg, s):
>> +    """Ask the peer to echo, and check the reply arrives intact"""
>> +    _send_with_ack(cfg, b'data echo\0')
>> +    ksft_eq(_recv_careful(s, 5), b'echo\0')
>> +
>> +
>>  def _check_data_outq(s, exp_len, force_wait=3DFalse):
>>      outq =3D 0
>>      for _ in range(10):
>> @@ -478,6 +498,7 @@ def _data_basic_send(cfg, version, ipver):
>> =20
>>      data_len =3D _send_careful(cfg, s, 100)
>>      _check_data_rx(cfg, data_len)
>> +    _req_echo(cfg, s)
>>      _close_psp_conn(cfg, s)
>> =20
>> =20
>> @@ -726,6 +747,7 @@ def _data_basic_send_netkit_psp_assoc(cfg, version, =
ipver):
>> =20
>>          data_len =3D _send_careful(cfg, sock, 100)
>>          _check_data_rx(cfg, data_len)
>> +        _req_echo(cfg, sock)
>>          _close_psp_conn(cfg, sock)
>> =20
>> =20

It occurs to me now that we could have just changed the key exchange
protocol used here to have a psp encrypted "start of psp" message that
each side sends and blocks waiting to receive like psp.rst suggests. Not
worth respinning, but maybe a future cleanup worth doing.
