Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F082F3A0B3E
	for <linux-kselftest@vger.kernel.org>; Tue, 21 Apr 2026 22:15:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776809707; cv=pass; b=rqEv8WxKZK1FirbTPAvjCEHc4FL4P1fMXIoXkvRDf6+SA6+d3ZRndfqJTPTCP9C6r8CMqTWSpxvrHqb8KQ4WUtmOLt61k0uP/U0HJAMDwTmCy4TICfCRCGXdlROXM9YmlNsGnSzZzgSXVu/2YQ67m9833/KY7QaumkJAufARiic=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776809707; c=relaxed/simple;
	bh=r9YiUiySMiRJh9aThR6CiNe12ewJmvjGzxDuXa4PXJI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FI+wkxUaZ1prxGGyltB1v8UZNI77WJK4YaTy/b1UMSpc0EANuWuJ5EcYOzQuA54QZHaff+eu0sd9cR1rHLmVkce/ARMH7vwAI7DB/4lY4HtVlBWp1tLwY2r5vzz7tOnbX/xBAsqMeAanHYnO3dMCErvU3wORAg89fECHgnXoK6s=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SyW40bs3; arc=pass smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SyW40bs3"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-43fea39e066so3735264f8f.1
        for <linux-kselftest@vger.kernel.org>; Tue, 21 Apr 2026 15:15:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1776809704; cv=none;
        d=google.com; s=arc-20240605;
        b=fWsgvzANo4PRUuS9qLl/7W0SqTX1NbaMVPKkajxWEzhhbMbN6WWgMV/8xrilQKMsV8
         exnTwFhYhNxk1ASdUIBH7LDHhPhBieCgVd6lyXt85+dpMXoJsDsckq7bc3zs6ZM3cepz
         Z4668A8L7oWC4hVUQeTAgYINPsOatNmDHVITnptzU+loEuMq3GWOF8lLkY7xemvzGAy6
         4rADRZ4hmjMMUGP6L7SqyPbW1RsdnoQtouK+r9THjQ/GYzCfQzwbXsRMtydSHkZIC2Ie
         TlOjmogCeU30YxHvaD+p18ijPNfzKLHAMp5x4mZCVNzZw6sBDmoDvoT8TyIHDGpcXvWx
         G4ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=r9YiUiySMiRJh9aThR6CiNe12ewJmvjGzxDuXa4PXJI=;
        fh=A3Txej+Aakb7YDt7ubhp+bpmybgnv6W5Qj9S+lp32iQ=;
        b=TCaLIxmf7zsHeVAFEYGQC9QJX9G6LrpLWhv3BemZSwlz/YoyqEF+L5R6e90H9+M0a0
         pRfT5fRgvwIU0zB4/6vlr9hPWaO3WmVPd8j7tghk3TgoastbFKAG8ggtKJOyL83fYzUC
         r2ENmG90y9ZDd22QjU9m1OrdJ9mBX5gYQGPOED5GcgVrh1c5CgH5dTqhvZo4Yl1/lDEc
         Ixh7b4xSzDBi5eNw4UqR+VFncQWzpC/K/nQ21UtHKlHzM/LI5ZJIsI6wXPGhp7QKbQeC
         uduhRFyraYhzDG9EAnxVBXoQ+L1zjgkUZy1LkKYjekuscnWssrVnrDFUb4CHRQJTj5v3
         P70g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776809704; x=1777414504; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r9YiUiySMiRJh9aThR6CiNe12ewJmvjGzxDuXa4PXJI=;
        b=SyW40bs3pvYSD6Zxq35BIsvasL9iCLeKK8i6S7Q3M4KBXnv6E49eW6UMlqGKayZPg/
         fh7emUQW+vCw6/DICpkj7Dxzt5rA9b5TwgfO5SKnzLxf1UmRwalNMDOeI0h/15qxkuW7
         w9FUloddTQJ8X4DGmkhCVrf3K/VEjEf84O7WmlukVbEVw8/BvqHQWI05UtVWPhYpCqwk
         QJxy90OskjJgOGHh9pVTbIHbV8T6UAzNzv8a/DCpL1pN+WYLN5vb4dxU9888FyuFCV2g
         tCbIuwVt74wcfrqRAFASm1oCamBQlMseOBSCfXePu6iO3RK86zV801og3mKEcLhr30QD
         J/jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776809704; x=1777414504;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r9YiUiySMiRJh9aThR6CiNe12ewJmvjGzxDuXa4PXJI=;
        b=DM+IoWpOZi0Pmji+EKs9CC+5a16D67eMy1QDtnkfNV13N5XdpHPysrOP1HqnRE1uHf
         EzuL38zyyO6Q/ed/4r/mQVd/+fgoKoleGgjkUgNddiB15b8AlPbG+VemOZF+gdozFGRE
         nPJUA+TZxmbXiueGgjqtGTCePyUbrRpQPxRXssvSmOmhpyzSyApud0ZV59eRxPqspTpu
         yNhEBlxx8uUCgqv8G3rOMnjKMG/A6594J3smcNakl6ROteWwoSdu7VDMx1AEJnNuG/Lo
         8/kRrAt5XVPAVPTLEfMMkhD1w4T2njcmO2f0lw03syAGviOG7mmfl+IkrfONJnmk8weL
         mQnQ==
X-Forwarded-Encrypted: i=1; AFNElJ9vsRTojNcn5VZcMmLWMQtyPFWimUNaItiIsD3MtuLnAQ2oPT7z+nK4NNrzXInOI1eTlWCaryxTiCReRJThLjs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxRQODw/DudVSOrBaRgtw8FJPueOevgH1KjWpTW4zZveYJt3wRk
	4f1/PwVo0gwqO+3I7QLEEfgoX90eBNIXlMIYMckQgMhX4Kw/OfbLWgJeFxANaKF0uYBPx/bB/4R
	rGmevHgTwZgRqQoAn0/2MKFa8hq7p1XA=
X-Gm-Gg: AeBDieuDGHbRU0lXkRAXChctl8KyjHhpoXyZG3vh9GZJLOZf3hOC+Qc/cxlF6LKEgLj
	4AJu9gGxHdgR1FqFVS3l1vrgJFJ95li7w/nE90HfXAJfENMJqSIBGSj0mhwidLYkMeGuNfO48G6
	4a7EEU21aZYKjT60cjCZ/0bnOSBfPygq2lLUmUn+Po2Td61RVzehuk9VNrI4X2iQjUqDpTRBHQv
	nbd/DoGFRRfQS5ihRg3v5AQEVy902BBf7t4b4zdOpVZTsoJvcikdy4c66XZURKw59Uda5TKDo4X
	P+TG56+O5mi/ZDExLgSwBFbDEsdlbhk+Dh9iIPJKCigJuS2zFOG/jzCQacv+dSlVmmuo68F7cIi
	BznS3wwLBpIJKdTw3SQ1kUx/nzuhjdX0qNAfk
X-Received: by 2002:a05:6000:1a86:b0:441:1df5:480c with SMTP id
 ffacd0b85a97d-4411df54848mr8169717f8f.42.1776809704286; Tue, 21 Apr 2026
 15:15:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260311-bpf-auditd-send-message-v1-0-10a62db5c92f@cloudflare.com>
 <aefnIw1Tx_2r5nkS@CMGLRV3> <CAADnVQJQxa+fHM9X8COc60ZMcxF0DMhWbtArg_gPynpbbg55TQ@mail.gmail.com>
 <CAHC9VhSo-M1wK2s2P0B+2F0pJqNguW7Kj-g63anp1xCMSBLa6Q@mail.gmail.com>
In-Reply-To: <CAHC9VhSo-M1wK2s2P0B+2F0pJqNguW7Kj-g63anp1xCMSBLa6Q@mail.gmail.com>
From: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Date: Tue, 21 Apr 2026 15:14:52 -0700
X-Gm-Features: AQROBzBdesRGwaAbHppflZu2UlSyoGakl7XBoNVRSXZffbkUa2RMfex5iK5obzM
Message-ID: <CAADnVQL33TOWFmxcWod3BCgmMXSQ=cEp6NCcxgQaJL0C7+Z9zA@mail.gmail.com>
Subject: Re: [PATCH RFC bpf-next 0/4] audit: Expose audit subsystem to BPF LSM
 programs via BPF kfuncs
To: Paul Moore <paul@paul-moore.com>, Linus Torvalds <torvalds@linux-foundation.org>
Cc: Frederick Lawler <fred@cloudflare.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Eric Paris <eparis@redhat.com>, 
	Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Eduard Zingerman <eddyz87@gmail.com>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, John Fastabend <john.fastabend@gmail.com>, 
	KP Singh <kpsingh@kernel.org>, Stanislav Fomichev <sdf@fomichev.me>, Hao Luo <haoluo@google.com>, 
	Jiri Olsa <jolsa@kernel.org>, Shuah Khan <shuah@kernel.org>, 
	=?UTF-8?B?TWlja2HDq2wgU2FsYcO8bg==?= <mic@digikod.net>, 
	=?UTF-8?Q?G=C3=BCnther_Noack?= <gnoack@google.com>, 
	LKML <linux-kernel@vger.kernel.org>, 
	LSM List <linux-security-module@vger.kernel.org>, audit@vger.kernel.org, 
	bpf <bpf@vger.kernel.org>, 
	"open list:KERNEL SELFTEST FRAMEWORK" <linux-kselftest@vger.kernel.org>, kernel-team <kernel-team@cloudflare.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 21, 2026 at 3:10=E2=80=AFPM Paul Moore <paul@paul-moore.com> wr=
ote:
>
>
> > It's still Nack.
>
> Based solely on the diffstat and a quick look, this appears to be an
> LSM patchset, not necessarily a BPF patchset; yes, there are kfuncs,
> but they are LSM/audit kfuncs and not core BPF functionality.
> Regardless, I want to see how the LSS presentation is received before
> worrying about this too much, but your NACK has been noted.

Paul,

told you countless times LSM cannot touch BPF bits without
explicit Ack.

So, no, you cannot add bpf kfuncs in random places in the kernel
And, no, you cannot call bpf internals through bpf_map_ops, etc.
