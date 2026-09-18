Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com [209.85.208.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6492F4D6C3C
	for <linux-kselftest@vger.kernel.org>; Fri, 18 Sep 2026 11:12:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789729981; cv=pass; b=kSizWQdUdzJHCk6UD8qSGgY22y4sBEaFPEZPG/HA2wXMPf8gCvZO4PtwGAPCWlkO1xsJk014A8wAVwm1UR+USChhiToLvMkhj3rKSz2qHtnT2hPw4q163xoS9Z4bvXIuSpfTcm1JVwppbp+gKr8rQqqZtukoZAakic6/92kVYMo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789729981; c=relaxed/simple;
	bh=TXdiK+zXX3XOHC+zbrRgQmzWKL9JH67eZAMPC/L+Ipo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F9uypefO2uaNbF/B203HWL6i3LyvB4LHO7D4HKRQIWO34vRYMWHJ6K902fuy73h7q75/gAXiFVpLGss2BoJp+2NXu18GS9l6PqEMMY6+FvVHDBqeU2YgIHXjlHz4aPemn/fbHI4+8/siEogk9cV0wd+b3Tkb0fZ9FJVldURQewQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=hPH5DHwy; arc=pass smtp.client-ip=209.85.208.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hPH5DHwy"
Received: by mail-ed1-f42.google.com with SMTP id 4fb4d7f45d1cf-6a5f9b036f9so5152a12.1
        for <linux-kselftest@vger.kernel.org>; Fri, 18 Sep 2026 04:12:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789729977; cv=none;
        d=google.com; s=arc-20260327;
        b=kNbwMNqOnAaIegO8r426vMZHKHoH2MglypwbnvywMev00b6IDKbYmB2rGIS/x2As8I
         cLxWV49moG3VUb2mxuxF3puhLSDRDpmkYCRqYPmfC4atPHGHGkMDXZ0V3gJHjIzQaijT
         5BZ/a8rO2Hsau2K7OCzVkbzSo/+A0CwIEm/4s/M0mXyhbIaxfaVm4zJjvSqIU/Zt8HHY
         5q4Wk/9TDnvxq4zgqGUYgZYMsQh/Dub0nHYYlvkfScJ74NhMcJus3Imlmv+f2YaXf2ET
         fsOAyrailgizG3f/OsWo//fB45VnOmrLmsBTYg08+5fW8DfYXvacr7r3J/s5o2iptHQa
         MeJQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=IsRHyK7/8v6RoJOuWPNWhyP8I7Up7HtkzKNhXSeAMl8=;
        fh=CLF5m4hZ5u9U+ElxtkvAjwFsH9cEJseIje8Y01jmfIE=;
        b=XTygO6oOBHa6CjZb0GxyZQPR966EGbIlIgm6jzrWAqubPPodeo0LOZ35JTahknfm2o
         JB5s47UKJLPdG6m+i+WJZezPNITBdRAIZ/sKt7PVxu+/I5nKuZNqT3cfOPkufEwVYtBU
         Q4XuiiUg8XTN8iGUIXhyq08yYDGSSYA8LqSJrR0BP9TS9UV0NYPNesZfR5qjqHnAoyq3
         IPasQCqGN+StVOQHR6hdkKI7yklyEXF89N+AkMGgYnbxm/bWeyCZOJTc+JYfD6k/i7it
         5jOCt5Za0xGrTz8RodZe1O1tBHQ3GXLGMcLEQ0EfMJffLpOI+XYUsF3rXO/e2MkTdB2j
         IEQQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1789729977; x=1790334777; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IsRHyK7/8v6RoJOuWPNWhyP8I7Up7HtkzKNhXSeAMl8=;
        b=hPH5DHwyZcX6rRCO/qljV7CtstYS4wkd8hQQSPvSO8ahuIG83enstvM2pB2/DOHywV
         BplLMYOGxu0EwmhkJ3oLKjb9fNU1fVQL8We2Wfxqlp44BLJlLCvegAqUD3B8sQbwbgm3
         d4kIbyjjepbF4Sf8sIrcJoKYHnIN+XzT34rrs+4YhWOYgYE8LJFqS004gO/8PWxxL9DF
         Jjl7Ew0OK6f56KjAkx5jVqylN7lXMoNoYqjrDzIeiC0xdisynQ6NHA9yzyVLUFqOBVNq
         cJFzrTkYEG6JfLIxM8Qh7HJp6TUsqiLjBHAyJNZzMbDrX4H6tL4V4d384NzbVe7tS1SP
         0Mbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789729977; x=1790334777;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IsRHyK7/8v6RoJOuWPNWhyP8I7Up7HtkzKNhXSeAMl8=;
        b=W9lfv5Djg3M3hCghbwidIlZ+XGM7DE88vIXtk9c7FBs5HpFi0Q5mf8GZfKzcDpEx8r
         OsY3E2s8DWMYH9TwjkqniE+eu9QcPMdgCn2nngCQYTbQRTRnwJS+Fxxz8x17A12Yh59U
         EWpIsWbqcgGNxTai5p2VXsu1mwfwoG8R2ZBceBX0NvhELfE5d4fnBfQbdGT3AochjITH
         pXHrM9VCbQsEhFC1VA7x4uZ5VEPxK34eLoBQm5PAFOmgbrJRTM+1tvSEtjPrI97i4+MV
         UrmUE9BzQ3kmQ7ybtOaL5gflP2Jaf5rJxDpjjJuypLQPQEU3P8RAQC1HcYMQC8UGCY89
         28Bg==
X-Forwarded-Encrypted: i=1; AKwUvByPY5GxactqlcqDtxk1Ze5yFUPNQfUH6madPv8NjgEa+2JbEk16SbJDXpXbY3L4jHYJF4wdI8rNGgjk/WnphD8=@vger.kernel.org
X-Gm-Message-State: AFuF++nI8SfApEVZhIqxrJYoMkZ0QPnOXKGJyZrYOy/EL63g9R595cI8
	ImNnmTCWthfuvO3fli+ja/MjF0vWBXRVe3WRSRBlGIcy99LorloDRf5Li9acI6EovATt12VRUs/
	8rseRi7ekYry1L2Kk+AAppVBQf/46xdkfxLXLd++m
X-Gm-Gg: AYBFou0cVOtO2JYFeTQw2WkjdKInqDk+mazmo+Cs+uRZedWFx1gYUYzr5ECmtFsZOG4
	nfwp3VwdIwERGxaPbnbqtlf4SKr8jJKfvMA+fvHgRTT9T50w0iKVq9LTCPQ3ZNsdl+Exwjre6N2
	OfDLqOLn3xp22dt0mYkW7jzX+qtAqsTeioPL9IxHwEywRH74AxWurfLTlJH3qo3wQn9Vb7fN6kB
	CGeE0/6Ku9AB7DGjHynbYtH4yLlJLkDCxfywPQ+r1kddz2Hjcac7/gYXP5YtEUjTSF/chjzLsYv
	UDdeQRnGRXEHhHAgxn/qzEWTjXWSx7M8+KbWubqUn5v5iJ1YL871vpU=
X-Received: by 2002:a05:6402:c318:b0:6a7:ef71:28e0 with SMTP id
 4fb4d7f45d1cf-6aa4de2f154mr26742a12.0.1789729977107; Fri, 18 Sep 2026
 04:12:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1789721173.git.zhang_wei@open-hieco.net> <1fc24efcd29e379c3784f661512cd3ebd833e463.1789721173.git.zhang_wei@open-hieco.net>
In-Reply-To: <1fc24efcd29e379c3784f661512cd3ebd833e463.1789721173.git.zhang_wei@open-hieco.net>
From: Jim Mattson <jmattson@google.com>
Date: Fri, 18 Sep 2026 04:12:44 -0700
X-Gm-Features: AcwNN1XzGDkuAKwNUHrle00CDHO2BYgnV92QAH54Tlu9yL0UYsep9hP_4pNWdHM
Message-ID: <CALMp9eR9zkPvmaiox1N9hxrCpuUmMzxPzynJyP3op=jhLZiXxw@mail.gmail.com>
Subject: Re: [PATCH v7 3/8] KVM: nSVM: Track valid hardware DecodeAssist bytes
To: Tina Zhang <zhang_wei@open-hieco.net>
Cc: Sean Christopherson <seanjc@google.com>, kvm@vger.kernel.org, 
	Paolo Bonzini <pbonzini@redhat.com>, Shuah Khan <shuah@kernel.org>, zhouyanjing@hygon.cn, 
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 18, 2026 at 1:56=E2=80=AFAM Tina Zhang <zhang_wei@open-hieco.ne=
t> wrote:
>
> VMCB02 instruction bytes are valid only for the hardware VM-Exit that
> populated them.  Track whether VMCB02 contains instruction bytes for the
> data #PF or #NPF currently being reflected to L1 so that stale bytes are
> not copied to VMCB12.
>
> Invalidate VMCB02's instruction-byte state when preparing VMCB02,
> normally in response to an emulated VMRUN.  Mark the bytes as valid only
> when the current VMCB02 exit is a data #PF or #NPF.  Opcode exits and
> instruction-fetch faults are excluded by inspecting the exit state.
>
> A subsequent change will use this state when propagating hardware
> DecodeAssist instruction bytes to VMCB12.
>
> Signed-off-by: Tina Zhang <zhang_wei@open-hieco.net>
Reviewed-by: Jim Mattson <jmattson@google.com>
