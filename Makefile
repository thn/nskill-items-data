#
# THIS SOFTWARE IS PROVIDED "AS IS" AND ANY EXPRESSED OR IMPLIED WARRANTIES, INCLUDING,
# BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
# PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE REGENTS OR CONTRIBUTORS BE LIABLE FOR ANY
# DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,
# BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR
# PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
# WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE)
# ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY
# OF SUCH DAMAGE.
#

clean:
	rm -rf items-eu
	rm -rf build
	rm NSkillV2.zip
.PHONY: clean

items: clean
	mkdir -p items-eu
	cp items/*.txt items-eu
	#
	# Regex funky magic stuff - Generate the items DB data for Germany and France users
	# who use a , instead of . for decimal numners.
	#
	sed -i -E 's/ ([0-9]+)\.([0-9]{2,})/ \1,\2/g' items-eu/*.txt
.PHONY: build

build: clean items
	mkdir -p build
	cp README.md build
	cp README.md build/readme.txt
	cp NSkillV2.exe build
	mkdir -p "build/items-EU - Germany and France users - rename folder to items to use"
	mkdir -p "build/items-EN - UK and US users - rename folder to items to use"
	cp items-eu/* "build/items-EU - Germany and France users - rename folder to items to use"
	cp items/* "build/items-EN - UK and US users - rename folder to items to use"
	date > build/build-date.txt
	cd build; zip -r ../NSkillV2.zip *
.PHONY: build
