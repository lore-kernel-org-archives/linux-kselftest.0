Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 77BF031CA4E
	for <linux-kselftest@vger.kernel.org>; Sat, 27 Jun 2026 17:35:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782581702; cv=pass; b=vC02xPzsIf8BtrOWDHYTLvSn773umWI/5dvhBXWUZzPhTkslL0xAfP1ijh3i1G9ESGEt/jRyepzu15fCQ8ll3yl2RlKD/J39uEE6y1LcUQx0dcNNXlyRcThjAEpL7a92Wxf7Av1jTlcoycfEAAFfP7RG9OnPGG3fdcEhd2ZbPqk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782581702; c=relaxed/simple;
	bh=EtSa3a4s7pUIWy8W5ASP2Hk6Xhg7fEmw0EI/tsx6ptI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cbZZ0dCBwcQYRANRjivezvxCKPPY/KSEOHC1hK93atDvTEkUJKx7khq4Vbg/WH1DoomaE7d4pIoGGDA25QlLDxzCnMHMun3YCW5Rx6e4YV4X/HLjy2oj+UqqHnYdP2x9r4hzDGjDIuiBI81yndglesnhq7mtIyZNrQ0dBGS8xIc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=rHMA200h; arc=pass smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rHMA200h"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-7e86d46b02dso26228987b3.3
        for <linux-kselftest@vger.kernel.org>; Sat, 27 Jun 2026 10:35:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782581699; cv=none;
        d=google.com; s=arc-20260327;
        b=Pdht9XCY3SzLw7eT6Drb6kKno7ChVtKPsKN34J2VFJjbeUNnOCbrAHuFUhyksOV6Hf
         2aF9q8NWSAVGSgODRkQjWgZAPMTYy0ZKn8EobfkMmxhOtfaa+TM7szLpCAbpBjdlDOVM
         yxUC+LZdoECQz81ucB+4yFEbeYDz+sXbIw9IHUGvBf1hGnViDOF7F7zPvviVsgJgDL3e
         Ld7NpDzcwxwXGnkW8+s53oToX9Osemn2Ro5YF/lI+uCjFRHKAtjMzxCfll3xJscGZAzo
         A3L8wgbOJwt6UbS9kBPL75Iz81gPW0EhuKggCKHIQKkbBAL9jT/yHuLuOGwBLkUPbd22
         bHUw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Dgu34QrpNJdt6cwZYfvIh4PfqfTJtLR90pHZigkhqr8=;
        fh=/GzU6kzuzMTHLmj0t815e1kWbeMwfWRPl83Rdqa0u38=;
        b=YABcoyqnuEEypDDAGdLbAIqyNXI/It4L+m9fNZD8tLyR00Fo8BT067zug5ieLX7y/d
         xVzStSR6uwDSVjTpFcU6yPpMxQvWfHWUKOS3gUNDn47pJf25Ylf/CoclDg2DuYit6/zm
         FEzXCCWjQG70mi388k/sXFIgyBjiHDxDAaQQkkiXmDseMst+NM+B9i8/o/4tskaeYAa2
         lgJMvoCHKXBYFuHnDaZt6qdKTwusdzFGfinGwu6Z07MtsbgB8aYbEqQOCnGyUZzMK5sr
         IAhFBWkBvlWh7IGOQByK9I9LvRx+1BCYYhIyMF1e562HxxyRsJ+IBgmSozioUfN8Qbap
         Jliw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782581699; x=1783186499; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Dgu34QrpNJdt6cwZYfvIh4PfqfTJtLR90pHZigkhqr8=;
        b=rHMA200h85kj5cgUDkXotqTcF9w2HC9z0SaL/mGqx7SI6VLThAmZXDrzzTQPc5hlK0
         y53Wz1YwaZT0FqhF7aVKBGu0UGUu3B8i0hQuXd6Bi5qgoSCQ6e/NawDcvdKaL9DeyV7W
         xNCd9PE3wRPCU3q5BophlCLtea/GkhQ3Ir5/XkBn7Rx6i/raJtK/rgmoFYfXRC2M6Y85
         JFERMRi4gagYs/2mrf71a1yYqiRdwkRul66mFIdZXJnDO65wavzoAXkG90rgp2bpaZ36
         PK8ehOMdTZtJ+xNqT4P02gv36vQAngW5JZsXpZBThPnFMw4G4dnk5MPUPD8SOKKmsVyz
         LpKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782581699; x=1783186499;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Dgu34QrpNJdt6cwZYfvIh4PfqfTJtLR90pHZigkhqr8=;
        b=iheTGh8zF8zg471zflH9V7nxmZjqqAfsvf9Jzw7Qef73vxTszeeCQ3rlo0yjFR8tqp
         hd18szIMSrFI3Oq6THtGyYQxrZt1Jk80SJajn46GldkxZG6Xrv70gsuMSoFMG7aR8nEZ
         SPBKpnDaHz0LXmug6bEL4fOV/4P3wRZLox0mnaiCuKv9T9abB15rLip9n0kdlnGaVmhE
         zok7P++pis20DURhZ5cxUEbuN+FusHHhuTffBjRvcRxrdcpzZP0QnPHoL8QsUQSU7csP
         GCovG5XoF8+o8LnYIcTGewZfkp1Whmp9SuKUt6NDFGFz5ZmqX2GeiAbVXGuugws7sJ+7
         dkaw==
X-Forwarded-Encrypted: i=1; AHgh+RpjXEwNVYCwg/aAm8WgBTj6Uf0BZou2EPzvD3ZfKDwKuJNKM2zSFV9G+6mcilesPkhVZFGGrFenhyOCYt1bfk8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwKqwvILFs0K1/fuG5VTQR0LxB9Ebi2VaWWrURE3g2TmDHbFF/q
	pQ2mN4Kxg2gHcBW5OyEtCWhdgS69KwoNq+VcBffLjsb16xyJMj/THHD7nNUbhCyVzhJc/m3qdpM
	ZQEzxEB2bamPd8aA/LV3mmH4YMKCpg3c=
X-Gm-Gg: AfdE7clxzPMw846+wo9K2gBRoTHN8Z0/gk+0m5JPAGa9IAEZtrDPhgf/Nt/96UXUrn0
	v15a6g0qBITGaPE7M9BajurbmlThhWNsBwyMdsV/1KVVQAmbZGo8q1ul6de36hY27tAobycOpdC
	5Ju8zSVKRnhk4EHqbiBCwv858s2UMIGZzFUYYT53FMC0oscpKBtHbN3+lu7sCm9mab1RGmGSfk4
	D0zdQc9O8QSCgaF26i6/Fq0V70/u+U0hw0OjyfqQgSW+Cc5UbII4/9Xqs5fs5EDIPtpOKKRUtU5
	c8pLoRLzHHOL+nb6sEWJBYxVS3W+mSthVnzi5xDOk/CSPSPF
X-Received: by 2002:a05:690c:e370:b0:7dc:1609:53ae with SMTP id
 00721157ae682-80a6a09b112mr118115867b3.25.1782581699520; Sat, 27 Jun 2026
 10:34:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260626-sockmap-lookup-udp-leak-v2-0-7e7e201c951a@rbox.co>
In-Reply-To: <20260626-sockmap-lookup-udp-leak-v2-0-7e7e201c951a@rbox.co>
From: sun jian <sun.jian.kdev@gmail.com>
Date: Sun, 28 Jun 2026 01:34:48 +0800
X-Gm-Features: AVVi8CdMPlgvdtTlopQ1G7HcBFTuPVL00FJZpDP6g1ISEPYbsnwP6Z4y-kISnc0
Message-ID: <CABFUUZGg1B0vaw9DFX3uTHxpRyyGtvn04Ae=Ob-VmnuVJB4KLg@mail.gmail.com>
Subject: Re: [PATCH bpf v2 0/4] bpf, sockmap: Fix sockmap leaking UDP socks
To: Michal Luczaj <mhal@rbox.co>
Cc: Eric Dumazet <edumazet@google.com>, Kuniyuki Iwashima <kuniyu@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Willem de Bruijn <willemb@google.com>, 
	John Fastabend <john.fastabend@gmail.com>, Jakub Sitnicki <jakub@cloudflare.com>, 
	Jiayuan Chen <jiayuan.chen@linux.dev>, "David S. Miller" <davem@davemloft.net>, 
	Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>, Alexei Starovoitov <ast@kernel.org>, 
	Cong Wang <cong.wang@bytedance.com>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Eduard Zingerman <eddyz87@gmail.com>, 
	Kumar Kartikeya Dwivedi <memxor@gmail.com>, Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Shuah Khan <shuah@kernel.org>, netdev@vger.kernel.org, 
	bpf@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 27, 2026 at 4:37=E2=80=AFAM Michal Luczaj <mhal@rbox.co> wrote:
>
> Fix for UDP sockets getting leaked during sockmap lookup/release.
> Accompanied by selftests updates.
>
> Signed-off-by: Michal Luczaj <mhal@rbox.co>
> ---
> Changes in v2:
> - selftest: drop the original, adapt old tests
> - fix: change approach to rejecting unbound UDP [Kuniyuki]
> - Link to v1: https://patch.msgid.link/20260623-sockmap-lookup-udp-leak-v=
1-0-05804f9308e4@rbox.co
>
> ---
> Michal Luczaj (4):
>       bpf, sockmap: Reject unhashed UDP sockets on sockmap update
>       selftests/bpf: Ensure UDP sockets are bound
>       selftests/bpf: Adapt sockmap update error handling
>       selftests/bpf: Fail unbound UDP on sockmap update
>
>  net/core/sock_map.c                                     |  2 ++
>  tools/testing/selftests/bpf/prog_tests/sockmap_basic.c  |  6 +++---
>  tools/testing/selftests/bpf/prog_tests/sockmap_listen.c | 17 +++++++++--=
------
>  tools/testing/selftests/bpf/test_maps.c                 |  6 +++---
>  4 files changed, 17 insertions(+), 14 deletions(-)
> ---
> base-commit: 26490a375cb9be9bac96b5171610fd85ca6c2305
> change-id: 20260617-sockmap-lookup-udp-leak-bc4e5c5481d7
>
> Best regards,
> --
> Michal Luczaj <mhal@rbox.co>
>
>

Hi Michal,

I tested this series on bpf.git base commit:
  26490a375cb9be9bac96b5171610fd85ca6c2305
The test environment was virtme-ng x86_64.

Before, with only patches 2/4-4/4 applied:
  sockmap_basic:  PASS
  sockmap_listen: FAIL as expected
    - UDP test_insert_opened failed on sockmap/sockhash,
      both IPv4 and IPv6
  test_maps:      FAIL as expected
    - failed at the new unbound SOCK_DGRAM update check

After applying the full series:
  sockmap_basic:  PASS
  sockmap_listen: PASS
  test_maps:      no longer failed at the unbound
                  SOCK_DGRAM update check
test_maps still later reported:
  Failed sockmap unexpected timeout

However, I can reproduce the same timeout in three consecutive
runs on the unmodified base commit, so this looks pre-existing or
environmental in my virtme-ng setup rather than a regression from
this series.

I am not adding a Tested-by tag for now because test_maps does not
fully pass in my setup. The targeted before/after behavior behaved as
expected.

Thanks,
Sun Jian
