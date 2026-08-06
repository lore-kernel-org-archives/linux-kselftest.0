Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AF1C48F847
	for <linux-kselftest@vger.kernel.org>; Thu,  6 Aug 2026 20:06:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786046778; cv=pass; b=GtBddc8yqWgaGbRr0+Y0N+2G7KRkjqbGpUwmiHFvMwFnsgpgGhPygpmrtlaFZgmSCBPJWCYBrSEAvE3FsOGYm2ax5b4oHLZrmehcNRWb7bNrc+FpGZYGtCKoFJLBg6fu9uHZg8H1GSEnxTdmebZE+3kTKCNME/Q6CaX34dkPIkw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786046778; c=relaxed/simple;
	bh=cWIjQk6tXuRqy0/rZp7RucU+ui1cJYOShoNg1BxqglE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RzHRZUJctANhEqJwI39u/6oi60zhGS7pJkpvAUEpdl5HU8jbxsuE/tT0RxiOfqIzGG/ipKYIN8pk+0fZ2+GBhPxj2g1VwHLVPjVaa04kKaC1Jz2BSsDdUBsOzLJe11iqlseDh3VuLdchav+Ea+2qZIEezOc1990pXHS8gOI18J4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DNU4V/Ki; arc=pass smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DNU4V/Ki"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2cede6375caso25945ad.0
        for <linux-kselftest@vger.kernel.org>; Thu, 06 Aug 2026 13:06:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786046762; cv=none;
        d=google.com; s=arc-20260327;
        b=R1Q8xrEa40wiXM/VLoHM/LbTKmox6z8EQcxXAMemLX5TFdm0oUr7jDY6nA/xc2PuHC
         Jp5k9hbpD6Z8IwcpKfQaKtj1nkoiwdTfDkhWoFYD0zMi9si1fcPUY8FIFf1DZbq2dy8t
         d9uYNqivX22Jh1xHTzRpqoKeqiytbGa0qLZB3U2k0DZDZOWlm00XGtmOptrU8LwpNcvi
         512D3tSvPQZ93u/scxyt+FftBUyhw2Tvk7Mlfb78GREuXMoxh7hgpJATLUwBf/AxqwTZ
         +LTezu8KRcgBKC/a5Rydl6r8coCl0f4dWv5JaVAJeCUKT9KCiNHlhXtzaOYNU2Q3beuO
         CJug==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mrZ72r7FXiIcu7z3qD5APJpQvHiMgq47+3gOT5xv3/4=;
        fh=ECqhn83Lfb96Qjf5T7kqAJwCDqo9HU3D1ap3t9jw4e0=;
        b=Njb2zlFm2L/9YTLeWEZQKdCGWkvEcWZfjvmmp0E3VpBYd9Ku+fceeNjC+tTG2m60G0
         ELlcGUkL3uxQIxyQwHCT7tBtRBI8sFo2oCE6rGv/U8o1uR+SoMcMcVvLWdxftYgIr781
         jqulk1ZxJpjyhx5msA+ZyI5nUEk57lrWwbBPt8oJwVuyVPUtuD7WiWVdAziKViTdsxkc
         9y7XPxHaEi8RO7HbwWC/QpfKZHK3dtEhNlwQUr4NJeZUB4wmcMYuFeu260vdCilZuLaY
         kMyFbn/WZBPeVl66BRt4OKvvhJDhUJ7ptgA07L5XBC6rN0SyLKPw1aLzFHJc2OYrEcXb
         JO6w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1786046762; x=1786651562; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mrZ72r7FXiIcu7z3qD5APJpQvHiMgq47+3gOT5xv3/4=;
        b=DNU4V/KieWIVELZmQzQQZ6oyKZ9ZT2hTa0D0Tsc+0dBcsz2fCcwju63a9cI9l9NapL
         9nOLMdx6ok2kIQzr939ZBZUhfCEp8nAea4nzuYvmyV3TNIZ/aJLY6ZEhGTNSMZbj9IW6
         4XfsTppQas+ghdqrGxzTCRDqNFKNjeNdz1WKP8YOMwvZGXhn+qIRVwZpz+HFLtsyoC28
         1mdgwhwDpJ+JHO4QMbRzDBXu8BOy2mlnsnPpzDncgc5+h4BpaDcRgV8JRCqJzt6EGCBo
         9RELnDHq68Xyzs/AMo1yiX6XExyl9T7F00m8I93HB39+200YeBd+PHb1pFJrEqan1tAi
         dwyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786046762; x=1786651562;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mrZ72r7FXiIcu7z3qD5APJpQvHiMgq47+3gOT5xv3/4=;
        b=mlwgwrYNpSqtEmDot3jSeK4uEeZ7nZjngeJnlFSg3GE+JXMjcxkoCXhyw1tWbeau7o
         I16IJJaQA/ueG0sVCKuxZV3/dV3EqwXDfpn70Y/eIYaiXDMBb6Ju5OHhqOQIs9XCa1HN
         FMWQxPDKG9vDWWhSxqk7eZ8BqsjENsfo71wqwQkE+EoZQz/Vk4RjLo2YAWG8rDvv6UCr
         etGEtaVGWayheaPMdnjssZ93oxhLGcyFVpDLkyuHeiJlGBo8tExa1mkFEc10invfIvpX
         OVzxDwnRszO3SHj9tAgxBlSXZqQZr/KoDoJ/pH0c/n5lmpefHDM0TlJ1V8ctaaQQpknz
         ipVg==
X-Forwarded-Encrypted: i=1; AHgh+RrLRwN/pzT7ioSmPE5m6AKAqIxSbkmrBhcXPMuySCOEprAI6QGuH7XLABniB5uzi0yh9gqQKyPwSLNZf3wRge0=@vger.kernel.org
X-Gm-Message-State: AOJu0YzKYxIrFluGPxmifYwt573R4ZwypCff/41lYr2JPVTj5zHQUlru
	C9nraBaXE2RmW4xNKnMOqQQAeG5DeiZm5yzVj4jJ67swTORmYgaM1PRTJzEXB/CDqDHivI4L8vC
	KZx63s/rG/sW6VK3k+FMjARSeXoFdlPT9MO2fxCK5
X-Gm-Gg: AR+sD11TwFdYeTIWrxtJfUAGp5FzSGdCFrNRAe1tRhpzz+sOfXeANiQHYEe5GgFnK4O
	QfRD/oUmhff09xjU7DIGcuJN0klH1XDLCagfs0NM6fY575BA5EkKCwApRAZdZDw45KFSczebhn5
	voWaG7NwYM7+8FGNUT8N876Oe6+gGc2kGs9CIib8cItcCkjA0u7jkQbyiZO2sIoNjYEsrPxyWKs
	47zCVcy2BgXqZ/1dAsUcVdpUPiv0EkH3rldanZIdeMdaNZst24DjyAHo3H2V4x/JNO9JEvNkH7i
	+IL08/7yXaKD0yVsyGmur06Ok4L+BVOe9poOrGo0BCOnnlPW5DLPRHQCmLaSpLkE0x3R2iELbjc
	og3qwwnZYag==
X-Received: by 2002:a17:903:2350:b0:2c7:f688:f22f with SMTP id
 d9443c01a7336-2d1205564femr2194675ad.13.1786046761601; Thu, 06 Aug 2026
 13:06:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260803181852.491437-1-almasrymina@google.com> <20260806121631.13175f7e@kernel.org>
In-Reply-To: <20260806121631.13175f7e@kernel.org>
From: Mina Almasry <almasrymina@google.com>
Date: Thu, 6 Aug 2026 13:05:49 -0700
X-Gm-Features: AUfX_myorKqYSVpHdpwmyJKvjXu8z142wx6thhNEgv0V6JXyc0wA6AgbxkiuwFY
Message-ID: <CAHS8izP=mgsdxv3AtjJo9JY5OHC17zeX-VbPPH_gFF=Ndb_qjw@mail.gmail.com>
Subject: Re: [PATCH net-next v2 1/2] selftests: drv-net: devmem: fix 5-tuple
 flow steering
To: Jakub Kicinski <kuba@kernel.org>
Cc: netdev@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Andrew Lunn <andrew+netdev@lunn.ch>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
	Paolo Abeni <pabeni@redhat.com>, Shuah Khan <shuah@kernel.org>, 
	Stanislav Fomichev <sdf@fomichev.me>, Bobby Eshleman <bobbyeshleman@meta.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 6, 2026 at 12:16=E2=80=AFPM Jakub Kicinski <kuba@kernel.org> wr=
ote:
>
> On Mon,  3 Aug 2026 18:18:25 +0000 Mina Almasry wrote:
> > When configuring traffic for the devmem tests, 5-tuple flow steering ma=
y
> > be required if the environment does not provide network namespaces.
> > Pass the correct remote address parameter and fall back to 5-tuple flow
> > steering if netns is not available.
>
> Could you clarify what existing upstream test / scenario needs this?

This is needed to give the check_rx_hds test a chance to pass on
5-tuple flow steering driver, like GVE. Without this change:

    # Exception| Traceback (most recent call last):
    # Exception|   File
"/usr/src/kernel/tools/testing/selftests/drivers/net/hw/devmem_lib.py",
line 219, in run_rx_hds
    # Exception|     wait_port_listen(port, proto=3D"tcp", ns=3Dnetns)
    ...
    # Exception| net.lib.py.utils.CmdExitFailure: Command failed
    # Exception| CMD:
/usr/src/kernel/tools/testing/selftests/drivers/net/hw/ncdevmem -l -f
eth1 -s 192.168.1.84 -p 46391 -L
    # Exception|   EXIT: 1
    # Exception|   STDERR: using ifindex=3D3
    # Exception|           using queues 15..16
    # Exception|           TCP header split: on
    # Exception|           Running: ethtool -X eth1 equal 15 >&2
    # Exception|           Running: ethtool -N eth1 flow-type tcp4
dst-ip 192.168.1.84   dst-port 46391 queue 15
    # Exception|           rmgr: Cannot insert RX class rule: Invalid argum=
ent
    # Exception|           Cannot insert classification rule
    # Exception|           Running: ethtool -N eth1 flow-type tcp4
dst-ip 192.168.1.84 dst-port 46391 queue 15
    # Exception|           rmgr: Cannot insert RX class rule: Invalid
argument
    # Exception|           Cannot insert classification rule
    # Exception|           ncdevmem: Failed to configure flow steering
    # Exception|           Running: ethtool -X eth1 default >&2
    # Exception|
    not ok 4 devmem.check_rx_hds

With this change:

    ok 1 devmem.check_rx
    ok 2 devmem.check_tx
    ok 3 devmem.check_tx_chunks
    # Exception| Traceback (most recent call last):
    # Exception|   File
"/usr/src/kernel/tools/testing/selftests/net/lib/py/ksft.py", line
420, in ksft_run
    # Exception|     func(*args)
    # Exception|   File
"/usr/src/kernel/tools/testing/selftests/drivers/net/hw/devmem.py",
line 30, in check_rx_hds
    # Exception|     run_rx_hds(cfg)
    # Exception|   File
"/usr/src/kernel/tools/testing/selftests/drivers/net/hw/devmem_lib.py",
line 219, in run_rx_hds
    # Exception|     wait_port_listen(port, proto=3D"tcp", ns=3Dnetns)
    # Exception|   File
"/usr/src/kernel/tools/testing/selftests/net/lib/py/utils.py", line
356, in wait_port_listen
    # Exception|     raise Exception("Waiting for port listen timed out")
    # Exception| Exception: Waiting for port listen timed out
    # Exception|
    not ok 4 devmem.check_rx_hds

Yes the test fails, but it gets past the flow steering configuration proble=
m.

And in the code, the change looks correct to me. If flow_steer is
False, then we don't pass the -c arg to ncdevmem. ncdevmem is written
so that if -c is not set, 5-tuple flow steering is not possible (the
client side port is random), so it falls back to 3-tuple flow
steering, which doesn't work on GVE or any other driver that supports
only 5-tuple flow steering.

run_rx (devmem.check_rx test case) doesn't have this problem because
it does `flow_steer=3Dnot hasattr(cfg, 'netns')`, but run_rx_hds has
this problem because it forgets to override flow_steer at all. This
patch fixes that.

To be honest while looking at this there were a few weird things. Like
I'm not sure why the python arg is named `flow_steer` (it likely
should be 5_tuple_flow_steer), and why flow_steer setting is tied to
hasattr(cfg, 'netns'), it should be a proprety of the driver you're
runing on (unless all in-netns drivers will support 3-tuple flow
steering).

I am planning to debug the remaining failure running check_rx_hds on
GVE and following up with another patch for that.

--=20
Thanks,
Mina
