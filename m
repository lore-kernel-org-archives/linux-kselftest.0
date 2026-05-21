Received: from mail-wm1-f66.google.com (mail-wm1-f66.google.com [209.85.128.66])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 930BB36A36B
	for <linux-kselftest@vger.kernel.org>; Thu, 21 May 2026 16:01:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.66
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779379306; cv=none; b=gCDpCMxQB1eC5jhHQg7AuUVl04txowb9qbNoTIlEW2LJysVtu/642q/Qt74eAjvRqlwBJDKIhwJHq1c3UFc5EwJZqukt7D1iPBpffBg0p1aQESSYz7nyxJwYVmvqrouFH1SyApI7HDK9GojVxivhvalreugJmF9YQjJbIBgd+lQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779379306; c=relaxed/simple;
	bh=4zM1ugNCLmNapDX1aXtA0pmcHFvT7iOMdAhWydF0hF8=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=CrDexUW4FD1aQuLwFvHqeNBi9YAlWOx2Px1zzRZEcqeeluZTeHYQIVLgJstsjtiZnsCZPLnML4MvLjTQ8hBudHqvSynoL1E1MjA7XqVkJeGucHN5GV7lJui7eqJrrN+ZYznAhzCOMbsvbUKsVifr8ko1BFBktAyRmZES8vBXMhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ovn.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.128.66
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ovn.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-wm1-f66.google.com with SMTP id 5b1f17b1804b1-48e6db3ff7eso33073895e9.0
        for <linux-kselftest@vger.kernel.org>; Thu, 21 May 2026 09:01:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779379303; x=1779984103;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:cc:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Hb7NHOCqWYUK919ibqoR4LSTe+C7bYY+lOLvabZfEs8=;
        b=O1ISsk/1J/MN84og0l8eDWH05M0M6sSp4I9ojr60JzHmAqSWJYfEsmxgvA4h2IWaaA
         qFYROted2f4SU2oJlY88YKaW/ecOX58myp7m56uBn1lVwj0y8y8V8zUmL0HpLkbzwegP
         c7+CzuMZtSWTd44VuMQJptX+6QcLUeqJjjmvh2sEFp+IA/uufVpF4fGo1x6aD9M3h8gm
         e3l2sMofEBmkLotLQkypecaRhSPAIulvaI66w53eh0uL/XX33mEhKzdmKirSeMTaOik9
         Xpdhyj0HP53Jfjl9A+dByFjjseOpc2ULaTH0sT/GlPqvXlhJkMGkRj4U7PboDh4Ei+o8
         Fu5A==
X-Forwarded-Encrypted: i=1; AFNElJ/UuZ71aOkuTva196P3fQIhvB0HOj2MQO6jRmHxQ8yta6gz8PJZ7Je6S0rOjE1mj/S30ZqSMVOpP+TQ73ghTAA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwUiah6kHNsWKDk8JmmLLPllWG7qnVFxxL9yo7Y0XSAy4OvqXg5
	e3wcdbJq7TSsEl1TR6hn3W4JUF9z+w9Ho5zjKlMj8u/r35tHKnLtTCpc
X-Gm-Gg: Acq92OF654la8eNQPpFivjNFRvmGf7v4jgJXmJ8PlgZIEPSy74gkT7JaKlT0LrbTotQ
	5KbPhgrOC2onlyxvfzYH6O6FifkxdAC26eZXicJW7UKO+luY/QEmhaHmZRPMRVUT6YMTbkA/wnY
	ssW63oIf9PYKn9SY0FKfN57vyh+g4b4yNeB1ZYLjiG2+k3Tb7Vl3ZiBbrXFJ3PRM1XQlI5AI1Zs
	7MFM4KwdX3yMMYFvD+RTgE71+hi9nGjf6nFasewf3ifbBoG1YFohGg8CMqx6C3HZ7o0X7nGQJaq
	bm9GgCbIEimgymWxGZjrBUJEEYZyKUNghZS1v5s/I9YrIfC/9B/1sYfswBArDXm/CReLfe1TPtY
	pzSqOM37VeMlJ54i5jDkbTs48Ev6wsSWLdTMz5V895imPE9r1TPePmSyafgSWlsR6M6f/a37yvC
	a7lNK/Duoh3/lbWxxL6rfgO+dV58I45tMRLDKP5qBQ81LJDbgILp9L5ArTnT9TLo+z531h5C89g
	ctJ
X-Received: by 2002:a05:600c:4818:b0:488:904b:f31 with SMTP id 5b1f17b1804b1-490360bac01mr35583275e9.22.1779379302644;
        Thu, 21 May 2026 09:01:42 -0700 (PDT)
Received: from [192.168.88.241] (89-24-33-222.nat.epc.tmcz.cz. [89.24.33.222])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49033cdcc01sm82691195e9.0.2026.05.21.09.01.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 21 May 2026 09:01:42 -0700 (PDT)
Message-ID: <b8183167-9e8d-4c75-b340-bc3437a14ea0@ovn.org>
Date: Thu, 21 May 2026 18:01:40 +0200
Precedence: bulk
X-Mailing-List: linux-kselftest@vger.kernel.org
List-Id: <linux-kselftest.vger.kernel.org>
List-Subscribe: <mailto:linux-kselftest+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kselftest+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: i.maximets@ovn.org, netdev@vger.kernel.org,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Simon Horman <horms@kernel.org>, Donald Hunter <donald.hunter@gmail.com>,
 Shuah Khan <shuah@kernel.org>, Kuniyuki Iwashima <kuniyu@google.com>,
 Kees Cook <kees@kernel.org>, Adrian Moreno <amorenoz@redhat.com>,
 linux-kernel@vger.kernel.org, linux-kselftest@vger.kernel.org,
 Matteo Perin <matteo.perin@canonical.com>
Subject: Re: [PATCH net v2 2/4] net: netlink: don't set nsid on local
 notifications
To: nicolas.dichtel@6wind.com, Jiri Benc <jbenc@redhat.com>
References: <20260520172317.175168-1-i.maximets@ovn.org>
 <20260520172317.175168-3-i.maximets@ovn.org>
 <bd9c0751-55ea-459e-8b22-8bd24abf235c@6wind.com>
 <20260521160036.413771e9@griffin>
 <9e7b7aab-dad4-4b72-87cd-822e67b27afe@6wind.com>
Content-Language: en-US
From: Ilya Maximets <i.maximets@ovn.org>
Autocrypt: addr=i.maximets@ovn.org; keydata=
 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
In-Reply-To: <9e7b7aab-dad4-4b72-87cd-822e67b27afe@6wind.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

On 5/21/26 4:25 PM, Nicolas Dichtel wrote:
> Le 21/05/2026 à 16:00, Jiri Benc a écrit :
>> On Thu, 21 May 2026 14:36:12 +0200, Nicolas Dichtel wrote:
>>> I still don't think that this is the right "fix". The app is broken. Even after
>>> this patch, the bug could be easily triggered again by a third party.
>>> There is nothing wrong with assigning a self-nsid. It would be a lot more robust
>>> for the app to assign itself a self-nsid when it starts.
>>
>> On the other hand, does the patch break anything in practice (as
>> opposed to in theory)? It makes live of several apps simpler, which is
>> not a bad goal.
> I'm not against the patch, it just look like a workaround.
> I'm trying to understand how NETLINK_LISTEN_ALL_NSID is used (in fact, why it is
> used if the app doesn't "understand" NSIDs).

ovs-vswitchd works with NSIDs of remote ports.  So it does understand them, it
just doesn't expect the self-referential ones for the local namespace.

openvswitch module has a minimal support for cross-namespace operation.  Ports can
be added to the openvswitch datapath and then moved to a different namespace (it's
a little weird use case, but that's beyond the point here).  ovs-vswitchd learns
new NSIDs of those ports from the openvswitch module and then it can perform a
limited set of cross-namespace operations on them and monitor their status changes
through notifications on an all-nsid socket.  It never learns the NSID of the
current local namespace, because all the local ports can be directly accessed and
openvswitch module doesn't report an NSID for them, as it's not needed for anything.

In the end, ovs-vswitchd knows all the remote NSIDs it needs to know and can
recognize them in notifications.  But it doesn't know the NSID of it's own local
namespace, as the openvswitch module never reports that for local ports and
ovs-vswitchd doesn't explicitly check its own NSID.  So, local notifications with
NSID set get treatment of a notification from some remote namespace that we do not
care about.

We will be putting changes into ovs-vswitch to work around this issue, simply
because it will take time for the kernel patch to propagate to distros.  But this
code will not be useful for anything except for working around this one specific
case and so it would be nice to get rid of it eventually.  And it would be nice
if future applications didn't need to care about this behavior as well.  Having
the fix in stable will speed up the process significantly.

HTH,
Best regards, Ilya Maximets.
