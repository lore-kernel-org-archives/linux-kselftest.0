Received: from mail-yx1-f53.google.com (mail-yx1-f53.google.com [74.125.224.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E8CEE38F623
	for <linux-kselftest@vger.kernel.org>; Thu, 14 May 2026 17:51:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778781090; cv=pass; b=SssPOOw763BmQKmxXjoLHsuNggzzukKFyqqX7XTK/iOFAZP93AuAiFx8xymWdqDr7loH4DAFMOQVqMFLeAvpfPloC+HobIUG9S9UnucLN+/neIAF1m472naXUk0RUrSnGbeVhMkhyItw0XdHLeeW4Z6RhabVUUCLWoopDG7y30g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778781090; c=relaxed/simple;
	bh=oEZTFGT/zsbjhwuKvWnfYPy3McEOR01XWhw4l9V3p8s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=oFYTY+8reKmPXdOda720LVliyNxx8sIDS3RfHE3jL8tb19C85j29c7jRn5isL08+t20Z8NkA7mCR7gdNC9bj3hvW8zGNd7B08UOaWxa2Rj2/UAdwEk1yc640LVEOs3mtWVcvRM4OBasp7S9+jaHpxdNMPfflpMp2t/6N9i6UebM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WYOv8U9k; arc=pass smtp.client-ip=74.125.224.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WYOv8U9k"
Received: by mail-yx1-f53.google.com with SMTP id 956f58d0204a3-65c24be9e4bso10586055d50.1
        for <linux-kselftest@vger.kernel.org>; Thu, 14 May 2026 10:51:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778781088; cv=none;
        d=google.com; s=arc-20240605;
        b=fTWm+JKEFMbfqxYlMK+CCorIMMAExsvcg6TmrABmu3KQxuqC3t4eAtkaxZPOEnwoYQ
         hrRLl/XRUuEUbnbOW4E8ZkP5xZtsbWvbBlLl5MLtXPTQ1917hW073kBEaRlg6ET2TXBp
         naLzbLO/C85ixzcpMAWPuoWlE/U06c3N1u+Mn0PqXt6rz+ns9kSIWFcNOtGg8PIXAOG1
         +GooHtB3lsFWIV4lWVwURdaATmrJ1tqW13+e1vFKBEsKXHY7PqvlTTrcIJpFyBacxzjE
         nQ+fXspFMSzEiclbFRWwww0t86rKi6W9bVe8IQIkQg1BfOOgky5IHxcX70DIR1UjcU35
         eycg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6wDiBZDMexEMEADEYdo6MQjjkOCysVPN+9Ft5KwrZRw=;
        fh=3wC3erM940HAMGkO5UNSUoKWZ0WvMQzlPKEP1S8fxPE=;
        b=erJU0tfsCYlpqsBvml2LVx3MuC+xz9aAdDXyZn0btpIS9gWvzCe/s/xaBxv1q25e43
         3NSA8vqab+UdHysGLao8He8Qv95it73gZ5wm/fzTtEFFUs0ttHujYF5OAUkZK2SZCD6H
         HE+CRZ4op2E2ZmJci+5cQxPdx/P8p4rJJ+lKMob2Q//i+2Wk/NvogTY5Qg28tLOLcEbr
         Xe+yNRr3SRd10VkSjGxS3zvdPbUIb6C9t7P2+I6iIspTerTUSih1ufEsEoTzXvT3lfUq
         e8LchksYBJ2xqso4G7WLxlHk2Hm0oqJj6WDNgDQJ+sBZ0TZTFfE65jQAnQDNjXID+PJH
         Kh2Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778781088; x=1779385888; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6wDiBZDMexEMEADEYdo6MQjjkOCysVPN+9Ft5KwrZRw=;
        b=WYOv8U9kRDVZWcHQGhZunhQgkMDOaeuANoqDV6EQmSWDBtReTLpolS3t154WTR3lb2
         8NHD5SZKRdBYk3aFv2Qzejs54BC99AnBhyuZeD6Yeq+MU/icS/UV5gOx7Tyhq8vt8AXk
         qkmmT5IUG6o1/2peFbqHZ2H6SvC1BAqQgodC9Bd0OPUPMB7peIvD9/51aUCwAGGa1Lnu
         lQB188mz52MAGzutTME0f9eJWFkWGZ5QFTKJp9bM0vvnHLNxa9H2lDODY+IX/Y/Bge/k
         fN8PZ9DTmWmWQeZvrpqDKjtzOxnYou5pMYmESdR1k3p9HBA7B+rnsRTvPiQvxOWdvKVd
         5cQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778781088; x=1779385888;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6wDiBZDMexEMEADEYdo6MQjjkOCysVPN+9Ft5KwrZRw=;
        b=agG1manc/DSN+aQVHcvL8yGi3lgas6CCWOUBZ6HItYpSPmZi60CVosSnR6GjxgFv5c
         q1W9QuOc++ioqgEuXw2wsMhCwi6TiKijKpCjwLZ6ukMDzKFXBBgF9+H2XUDLok8PP/3Q
         9kVR8F83UPXtJ1bmDWC9AfDrxuOm7v8IFnflhCSCWgLiCwksKHRZjA/4gxfmaR/0CShm
         rN6UdhojyVOoM7I3HNWJQzsX5S8m08417i/ikgufTOFAlL3+iDH4jLL0Ksk37f80Ijdk
         v8WlxqgpWAvVTquso5xk9VwyKPBago5N+B00lyM8owCypm4iNMiptPIHu7cDsGD24/rf
         zRBQ==
X-Forwarded-Encrypted: i=1; AFNElJ+ss4HGf7hsQ5SxX6Dl1OVSc+rCJSDz6B8G52KP4qsb/HM4O+Ennz2rMfAElXjmy7x+U1QHvNoixM69YM58wLM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKiAGp2vORHefpHdnY+aLWPcVxWRKSgFd78kZDhP5IMQ9KHgYE
	dOXp7ICNgldon1FBx0XC46g8X9R+cMLMOJmTXT1mjn0/6W81BhWr2yihImu4WZYt3du7UNPLOtV
	eC51vupnXwIMzk/jzjI/2xRCwv1+VcI4=
X-Gm-Gg: Acq92OHT0e44g6ZmtYbK98HrVEgEAU9JiMA0QKmxho3kpYHAoHBEuJGEG/JCAHUHbEh
	YrZf3HD0ROyAI7o6nhXfLdjA0JMmHIe7rv7CJeC+KKDw0WVrmx5bmTmvU0e0EpXoOyiUgElkV5b
	VoAkYyfegdwz25DSDjB+kubKit7wtbmO+7/FFr2oOlUo7tqVmatpK9r/S+BsicA1A/Fiz9/5vzM
	7QuoaM/LQErv1uxKl41jbOvA06V/Hqc6nm64irbw8A4wnu8SGvzwHjPuKMj/B5611znSehrdIMD
	C9a1Q6AC5bjL/qPTqZ4jUXq2KWRDWBYLufjzPgwgb50XdtBba6LbYKRPfOKNXSZHrxphY7NRfpK
	Jxxrn
X-Received: by 2002:a53:c049:0:10b0:651:c047:f09c with SMTP id
 956f58d0204a3-65e227d52f7mr245379d50.39.1778781087600; Thu, 14 May 2026
 10:51:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260512-getsock_three-v2-0-30b7b22ef14c@debian.org>
In-Reply-To: <20260512-getsock_three-v2-0-30b7b22ef14c@debian.org>
From: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
Date: Thu, 14 May 2026 13:51:16 -0400
X-Gm-Features: AVHnY4LxOXAY7x1GGPoD-ZrWMAi2sQqAU3A0fF7icss2dq6JW-g14LN3XOF-d6E
Message-ID: <CABBYNZ+nvtMHcU9but5VEG891vyO=K0MF3OAGofANxzdLVmw-g@mail.gmail.com>
Subject: Re: [PATCH net-next v2 0/6] Bluetooth: convert remaining bluetooth
 socket families to getsockopt_iter
To: Breno Leitao <leitao@debian.org>
Cc: Marcel Holtmann <marcel@holtmann.org>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Simon Horman <horms@kernel.org>, Shuah Khan <shuah@kernel.org>, linux-bluetooth@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Breno,

On Tue, May 12, 2026 at 7:12=E2=80=AFAM Breno Leitao <leitao@debian.org> wr=
ote:
>
> Continue the conversion to .getsockopt_iter for the Bluetooth socket
> families: hci_sock, ISO, RFCOMM, SCO and L2CAP. The first patch is a
> small precursor that fixes a long-standing 1-byte put_user write in
> hci_sock_getsockopt_old() so the subsequent conversion stays mechanical.
>
> The riskiest change in this series is the SCO BT_CODEC conversion: it
> is the only one that drops an open-coded ptr cursor in favour of
> relying on iter_out advancing naturally on every copy_to_iter() call.
> Every other socket option is a near-mechanical s/copy_to_user/
> copy_to_iter/ rewrite, but BT_CODEC walks a variable-length list of
> codecs + capabilities and previously tracked its own write offset by
> hand. Getting the cursor semantics wrong here would silently truncate
> or misalign user-visible codec data.
>
> For more context about the motivation for this change, please check
> commit 67fab22a7ad ("net: add getsockopt_iter callback to proto_ops")
>
> Signed-off-by: Breno Leitao <leitao@debian.org>
> ---
> Changes in v2:
> - rebase the tree on top of bluetooth-next.
> - Remove the selftest, which was mixing network and bluetooth together.
> - Link to v1: https://patch.msgid.link/20260511-getsock_three-v1-0-1461fa=
8786ab@debian.org
>
> To: Marcel Holtmann <marcel@holtmann.org>
> To: Luiz Augusto von Dentz <luiz.dentz@gmail.com>
> Cc: linux-bluetooth@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
>
> ---
> Breno Leitao (6):
>       Bluetooth: hci_sock: write the full optval for getsockopt
>       Bluetooth: hci_sock: convert to getsockopt_iter
>       Bluetooth: ISO: convert to getsockopt_iter
>       Bluetooth: RFCOMM: convert to getsockopt_iter
>       Bluetooth: L2CAP: convert to getsockopt_iter
>       Bluetooth: SCO: convert to getsockopt_iter
>
>  net/bluetooth/hci_sock.c    | 26 +++++++++++--------
>  net/bluetooth/iso.c         | 27 ++++++++++----------
>  net/bluetooth/l2cap_sock.c  | 61 +++++++++++++++++++++++++++------------=
------
>  net/bluetooth/rfcomm/sock.c | 30 ++++++++++++----------
>  net/bluetooth/sco.c         | 59 ++++++++++++++++++++++-----------------=
----
>  5 files changed, 114 insertions(+), 89 deletions(-)
> ---
> base-commit: c2f0079e8c42fd6814c8d6b1491e3ce0a0e3b3fa
> change-id: 20260511-getsock_three-d0d7f1b2629e
>
> Best regards,
> --
> Breno Leitao <leitao@debian.org>

There are some comments from sashiko on this:

https://sashiko.dev/#/patchset/20260512-getsock_three-v2-0-30b7b22ef14c%40d=
ebian.org

Now Im not sure the truncating is actually used by our tools, but that
sounds like it could break userspace if we don't check properly, or
have you already done this for other socket families and it was
considered to be ok?

--=20
Luiz Augusto von Dentz
