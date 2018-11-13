From: gorcunov@gmail.com (Cyrill Gorcunov)
Date: Tue, 13 Nov 2018 20:01:01 +0300
Subject: [PATCH v2] proc: fixup map_files test on arm
In-Reply-To: <20181113165446.GA28157@avx2>
References: <20181110184920.GA18252@avx2>
 <1541904527.857883.1572718104.2AE8D0DA@webmail.messagingengine.com>
 <20181112141456.GA15690@avx2> <20181112155559.GV13195@uranus.lan>
 <f1805813-62b7-8572-d906-bc49b62d1bf3@linaro.org>
 <20181113165446.GA28157@avx2>
Message-ID: <20181113170101.GX13195@uranus.lan>
Content-Type: text/plain; charset="UTF-8"
Message-ID: <20181113170101.4ENlzci1WshBPgsFGBtsL2tWIIBmjFKONg1gc79NpPA@z>

On Tue, Nov 13, 2018@07:54:46PM +0300, Alexey Dobriyan wrote:
> https://bugs.linaro.org/show_bug.cgi?id=3782
> 
> Turns out arm doesn't allow to map address 0, so try minimum virtual
> address instead.
> 
> Reported-by: Rafael David Tinoco <rafael.tinoco at linaro.org>
> Tested-by: Rafael David Tinoco <rafael.tinoco at linaro.org>
> Signed-off-by: Alexey Dobriyan <adobriyan at gmail.com>
Acked-by: Cyrill Gorcunov <gorcunov at gmail.com>

Thank you!
