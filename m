From: davem at davemloft.net (David Miller)
Date: Sat, 28 Jul 2018 14:18:12 -0700 (PDT)
Subject: [PATCH 00/18] xfrm: Add compat layer
In-Reply-To: <1532795215.2679.27.camel@arista.com>
References: <1532703111.2679.20.camel@arista.com>
 <CADhJOfam+cY8uD4XTGvZSEFQdAgTu49G6cg6c64NJoP3bNuBmw@mail.gmail.com>
 <1532795215.2679.27.camel@arista.com>
Message-ID: <20180728.141812.1026007723536955024.davem@davemloft.net>

From: Dmitry Safonov <dima at arista.com>
Date: Sat, 28 Jul 2018 17:26:55 +0100

> Well, I think, I'll rework my patches set according to critics and
> separate compat xfrm layer. I've already a selftest to check that 32/64
> bit xfrm works - so the most time-taking part is done.

The way you've done the compat structures using __packed is only going
to work on x86, just FYI.

The "32-bit alignment for 64-bit objects" thing x86 has is very much
not universal amongst ABIs having 32-bit and 64-bit variants.
--
To unsubscribe from this list: send the line "unsubscribe linux-kselftest" in
the body of a message to majordomo at vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
