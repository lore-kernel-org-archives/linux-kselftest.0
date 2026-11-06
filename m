Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793990076;
	b=p1RcBN3u3zAtviGIG5LHyPScU0Y0sWIO1HpqZpxYaF5+BPxQ2Z7D/OD0LA7vsGJjZfUu
	 qWvC5P6/Au+cjMTjKvrNEn81lNVPksRiHo8JSf8APsNXyxnofgPni+zNphaYAmD6ckJq7
	 WET5aUKELSxCPLU1CE38cQfzZmJHOl02UwyafT4Jxf78fEI8Hv8MvJzHP42SmrpoNsAVA
	 Gni7uYM+C914OqAqkVlfs9nwMjv6V41O1p9yQNHWNRnEGR+SEcJLwTUMGqigioww04nvl
	 Trw3mr8iJr5+ujpUkutppws09Bzd6hJ3tuf60ho8enBC9xNE+5s9RzW9KA8z8YTpm+w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793990076;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Mime-Version:Content-Transfer-Encoding:Content-Type:Date:Message-Id:
	 Cc:Subject:From:To:X-Mailer:References:In-Reply-To;
	bh=+c0xWdkkcKoTE4Rdj27Yc3MLhE6rmfRXOfJT2CGVuAQ=;
	b=VAZgvLnCb2h7CqffcQ0/IU1TPGjzptsSFYR0VhXZ4cYWdG6OgcRsaxCzGTJYtQm7ZbTc
	 pGK5Lefl7RyzsgIfGLTYTx/uXOYdjBAssV4QbXeBGTdiOWdjR3xS3GGwl7gMB5ipjfIIh
	 Dk+EhlIqk1dvry0+7fshM0RlDFW/JENBqGbnAKcAt9uNKoua9q+zW8rBbwLZQKi4ScLSN
	 qjS6zuW7LICJ3I44cVDQWREgMxh2WK+nI2ELWKQR3U4jZnYWRr6VeEw9N30BmOvqrYMpu
	 Prx9mS3gcE5dVQ8bFT++EG3l8ugs91m8K9+4HCxilKzvCuuMGpwb2+LisWU832PvlKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=azEJaddf;
	arc=none smtp.remote-ip=209.85.219.45
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D82B2606A331
	for <linux-kselftest@vger.kernel.org>; Fri,  6 Nov 2026 18:34:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D82B2606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=azEJaddf
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-91ea2e29d90so16226176d6.1
        for <linux-kselftest@vger.kernel.org>; Fri, 06 Nov 2026 10:34:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793990075; x=1794594875; darn=vger.kernel.org;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=+c0xWdkkcKoTE4Rdj27Yc3MLhE6rmfRXOfJT2CGVuAQ=;
        b=azEJaddfPLszRG2YEd8X8XX3QNSmADkhMqqQkz8WJCqDHCX/yElegKK2JUmNUFCVFn
         1m9uk2k/p4dq4w3fJAA/u/LJ3eU7HusdduRCkLAdoeLqlRTmain3Uqa0I68B02+FRZjN
         iz+KKvNA8NWhZE+WAdsdD77VmTCugNNKnPrerZfcB2h7EcelHiX5fEb4Rx1oJuYFUAkl
         nqZXZGuHeNLKXtxcXQ2MZVRcRDisv+8FiLqCpkzml5h6bYhW6O6CeuCKbMBPGtv4XmJK
         Bp4PO2afCpZFU6DuKRKSo4n/5AT3FCs/rRv0Vms0kdAB3NGupdnhqglYZoGMUaE+OrJ4
         yZog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793990075; x=1794594875;
        h=in-reply-to:references:to:from:subject:cc:message-id:date
         :content-type:content-transfer-encoding:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=+c0xWdkkcKoTE4Rdj27Yc3MLhE6rmfRXOfJT2CGVuAQ=;
        b=MdD2M4B+VHjUiLvpbeMuk589gYa9DhEubyg2HC6SJLJvjVytiu4cIKkuSY6zVku6bx
         Y9HkBCGRScbAvKkDTJtEiG/VLm8pbaLepWyfvTs13bsY8+hjS5/g/73v7E5X++BMrr9l
         E0gx+493iGXMGntfdpphpxrVBIfhLqfkYCmo7eX8C+zK1EIKaaQNICTSKLEczonZWWYt
         pB/H1AyWoMqwx7SFzLVCJr/1x05U+u4xvIfp5kIbhDL6aEpeAtmrfs/Jhvw+4k8pQa2O
         3Lu9eDPm1QI1ZjwqT+SlvlMNY3W0q+OFpDiQuVPzwRL5efXUyO7g/ygqnK5RtBTG7l7I
         1OFg==
X-Forwarded-Encrypted: i=1; AL+hErGNt2BP+fdXljjVkqsNYs8bkFp65Hrpsb1M76Echb/myKz72Umc7t+M5TB2eRvKCSRnhfrCzfajLMAEe73VCt4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+pbJXOsYwhc20gjW6qXRHOjwRPVtq7bLanLJfR0h9x6SQTdiCo
	j4WUc7Qj8eecXZ41JqmlkhDDSclnCXB40QAJeCyrdPIidulhdDLyw1l8
X-Gm-Gg: AYBFou3FzWe8YwTSnKxNgMxea8sGQOeEjaXt/MXknQrefZHNJGP54S5B0y+rThUQYvk
	Sam6Xg/Oi9uCzgvid0By25xNjTM/ELVzxYdCMRwFtorpqw3VvOc+1vmgiHdtDUbZbgYl6SwDyF6
	/nYnn8QKwxgZIkCPcDrKaWkDGfLjPLnzjL1XtkbLK5/BMeUdF7FUxy9vsTNrvq8OxqLn3jaVC9X
	v63ry7RfZ9241ts9UhkCudRB2skuGOSzCYA8RagCKRzkjIJoHRnXNBZg14wp2YezCPItzZCDF/F
	qkLhHTmrgDfdCFJGKIRYpzg0LjBrBNsvHqfAhyqp7jkNe1HJxJW/LAgPwLJY39s0wCcmQ7CXbr3
	0Lrz2SeZ9tM5dQtTfVDxrNjUg1D3RdpmXiq4OYRPAIseiboMhTEf3yh7SJeDQclmn+hCc3g0X+B
	QFSHIPUlP9/RBo9BNb3HtCs1wcHXynyUqpAHpPZBTNPFlWaOcxP2LjULJ+JhBc5E3VE6JyTde4F
	CRFUPuZFPB9ttxJgPwon8aNWccxvLLTaH/nvPh2s5MJdDSfX4wfUKWsQmwx/m1cDCBfph8nCyPj
	RKeBPi+lGOLJOimh/g==
X-Received: by 2002:ad4:4ee7:0:b0:91b:bcf5:a733 with SMTP id 6a1803df08f44-91ea9304f4amr50544826d6.2.1793990074822;
        Fri, 06 Nov 2026 10:34:34 -0800 (PST)
Received: from localhost ([2620:10d:c091:500::5:81c8])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91ea6900b00sm26542996d6.4.2026.11.06.10.34.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Nov 2026 10:34:34 -0800 (PST)
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
Date: Fri, 06 Nov 2026 13:34:33 -0500
Message-Id: <DMOCEM7IQVOS.I2QH7FT8FT8S@gmail.com>
Cc: "Simon Horman" <horms@kernel.org>, "Jakub Sitnicki"
 <jakub@cloudflare.com>, "Daniel Zahka" <daniel.zahka@gmail.com>, "Willem de
 Bruijn" <willemb@google.com>, <netdev@vger.kernel.org>,
 <linux-kselftest@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <bpf@vger.kernel.org>
Subject: Re: [PATCH net v3 2/2] selftests/net: psp: test bidirectional data
 transfer
From: "Daniel Zahka" <daniel.zahka@gmail.com>
To: "Wei Wang" <weiwan@google.com>, "David S . Miller"
 <davem@davemloft.net>, "Jakub Kicinski" <kuba@kernel.org>, "Paolo Abeni"
 <pabeni@redhat.com>, "Andrew Lunn" <andrew+netdev@lunn.ch>, "Shuah Khan"
 <shuah@kernel.org>
X-Mailer: aerc 0.21.0-threadmapfix
References: <20261106182007.374660-1-weiwan@google.com>
 <20261106182007.374660-3-weiwan@google.com>
In-Reply-To: <20261106182007.374660-3-weiwan@google.com>

On Fri Nov 6, 2026 at 1:20 PM EST, Wei Wang wrote:
> _data_basic_send() and _data_basic_send_netkit_psp_assoc() currently
> only verify unidirectional data transmission from the test socket to
> psp_responder. As a result, they do not exercise the receive path for
> PSP-encrypted TCP data segments arriving at the test socket (such as
> packets redirected across a netkit interface associated via dev-assoc,
> which relies on SKB_EXT_PSP surviving packet scrubbing).
>
> Use the existing "data echo" command in psp_responder to verify that the
> test socket can also receive PSP-encrypted data from the peer in both
> _data_basic_send() and _data_basic_send_netkit_psp_assoc().
>
> Signed-off-by: Wei Wang <weiwan@google.com>

Reviewed-by: Daniel Zahka <daniel.zahka@gmail.com>

> ---
>  tools/testing/selftests/drivers/net/psp.py | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>
> diff --git a/tools/testing/selftests/drivers/net/psp.py b/tools/testing/s=
elftests/drivers/net/psp.py
> index 473500901879..c114d2245135 100755
> --- a/tools/testing/selftests/drivers/net/psp.py
> +++ b/tools/testing/selftests/drivers/net/psp.py
> @@ -120,6 +120,26 @@ def _check_data_rx(cfg, exp_len):
>      ksft_eq(read_len, exp_len)
> =20
> =20
> +def _recv_careful(s, target, timeout=3D2):
> +    """Read exactly target bytes, tolerating short reads"""
> +    data =3D b''
> +    end =3D time.monotonic() + timeout
> +    while time.monotonic() < end:
> +        try:
> +            data +=3D s.recv(target - len(data), socket.MSG_DONTWAIT)
> +            if len(data) =3D=3D target:
> +                return data
> +        except BlockingIOError:
> +            time.sleep(0.001)
> +    raise KsftFailEx(f"short read, got {len(data)} of {target} bytes")
> +
> +
> +def _req_echo(cfg, s):
> +    """Ask the peer to echo, and check the reply arrives intact"""
> +    _send_with_ack(cfg, b'data echo\0')
> +    ksft_eq(_recv_careful(s, 5), b'echo\0')
> +
> +
>  def _check_data_outq(s, exp_len, force_wait=3DFalse):
>      outq =3D 0
>      for _ in range(10):
> @@ -478,6 +498,7 @@ def _data_basic_send(cfg, version, ipver):
> =20
>      data_len =3D _send_careful(cfg, s, 100)
>      _check_data_rx(cfg, data_len)
> +    _req_echo(cfg, s)
>      _close_psp_conn(cfg, s)
> =20
> =20
> @@ -726,6 +747,7 @@ def _data_basic_send_netkit_psp_assoc(cfg, version, i=
pver):
> =20
>          data_len =3D _send_careful(cfg, sock, 100)
>          _check_data_rx(cfg, data_len)
> +        _req_echo(cfg, sock)
>          _close_psp_conn(cfg, sock)
> =20
> =20

