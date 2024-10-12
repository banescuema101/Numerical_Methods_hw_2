## TASK 1

# 1. Funcția stereo_to_mono. 
  
  Initial, obtin dimensiunile semnalului stereo, apoi initializez cu zerouri vectorul coloana, mono, de m linii (unde m reprezinta numarul de linii al semnalului stereo). Aplic formula data in enunt si la final normalizez si returnez semnalul mono obtinut.

# 2. Functia spectogram.

  Determin lungimea semnalului, calculez numarul de ferestre in care se imparte semnalul, dandu-se ca parametrul functiei dimensiunea ferestrei, apoi initializez fereastra hann, cu functia specificata in cerinta, hanning. Initializez matricea spectogramei cu zerouri.
  Iterez prin fiecare fereastra si in bucla for, calculez indicii de inceput si de sfarsit ai fiecarei ferestre, stiind dimensiunea ei, deci mi a fost usor sa ii aflu. Si astfel imi construiesc semnalul din fereastra curenta, de la (i-1) * window_size + 1  pana la start_idx + window_size - 1. Multiplic cu fereastra hann si aplic transformata fourier, cu valoarea frecventei de doua ori mai mare decat dimensiunea ferestrei. Calculez magnitudinea, luand in considerare doar la prima jumatate a semnalului transformat, iar magnitudinea spectrului o stochez in matricea spectogramei, pe coloana aferenta. La final, calulez vectorul de frecventa si de timp.

## Scurta interpretare a spectogramelor

  # . Spectrograma Plain Loop:
      Această spectrograma prezintă benzi verticale de culori variate (albastru și galben) cu intensități diferite.
      Benzile luminoase imi sugerează prezența unor frecvențe cu amplitudini mari în momentele respective, iar diferentele de lațime a benzilor imi indica variatii în conținutul sunetului sau schimbari în timbrul acestuia. Rezprezinta o buclă de sunet repetata,
    cu caracteristici periodice.

  # . Spectrograma Plain Sound:
    Observ linii verticale dense de culoare albastra, iar amplitudinile sunt mai uniforme decat cele din spectograma plain loop, semnalul pare sa fie mai complex, cu mai multe componenete de frecventa.

  # . Spectrograma Low Pass Sound:
    Aceasta este o versiune a semnalului “Plain Sound” după aplicarea unui filtru trece-jos. Se observa ca benzile de frecventa mai inalte
au fost atenuate, ceea ce explică aspectul mai uniform al benzilor verticale, iar semnalul care rezulta are o frecvență de taiere mai mică.

  # . Spectrograma Reverb Sound:
    Aceasta prezintă un semnal cu efect de reverb, iar benzile verticale sunt împrăștiate și au o structură mai difuză. Din acest lucru,
reiese ca reverbul adaugă o componentă de spațialitate și persistență a sunetului.

  # . Spectograma Tech:
    Spectograma prezinta benzi verticale discrete (similar cu Plain Loop) dar cu o structură mai difuza (similar cu Plain Sound). 
    De exemplu, dacă sunetul "Tech" este generat din kick drum și hi-hat, ma gandesc ca spectograma prezinta benzi verticale discrete la frecvențele fundamentale ale acestor instrumente.

  # . Spectograma Low Pass Tech:
    Spectograma arata o versiune "estompata" a spectrogramei "Tech", atenuand frecventele înalte deasupra frecventei de taiere a filtrului.

  # . Spectograma Reverb Tech:
    Spectrograma are benzi verticale împrastiate si o structura mai difuza din cauza efectului de reverb.

  # . Spectograma Low Pass + Reverb Tech:
    Spectrograma este o versiune "estompata" a efectului de reverb pe "Tech" (dacă filtrul trece-jos este aplicat înainte) sau un efect de reverb atenuat aplicat întregului spectru (dacă ordinea este inversata).

  # . Spectograma Reverb + Low Pass Tech:
    Spectrograma arata efectul de reverb aplicat întregului spectru urmat de o atenuare a frecventelor inalte sau invers, in functie de ordinea procesarii.
  
# 3. Functia Oscilator
  
  Calculez numarul total de esantioane, rotunjind valoarea produsului dintre durata semnalului si rata de esantionare si creez vectorul de timp care va reprezenta momentul de timp pentru fiecare esantion. Apoi memorez in sin_wave unda sinusoidala si calculez numarul de esantioane pentru fiecare dintre  cele 4 faze ale envelopei atac, descrestere si eliberare. Durata de esantionare S, o voi calcula ca diferenta dintre suma dintre A, D, R si durata totala a semnalului.
  Creez envelopele pentru fiecare faza si apoi le concatenez pe o singura coloana. Un lucru pe care il mai mentionez ar fi acela ca in final, ma asigur ca lungimea envelopei este mai mare sau egala cu numarul total de esantioane, punand zerouri la finalul ei daca e nevoie, sau micsorand-o daca e prea lunga.

# 4. Functia Low-Pass
  
  Calculez transformata fouriei a semnalului de intrare si apoi toate frecventele posibile pentru semnalul dat, determinate prin produsul dintre frecventa de esantionare si secventa de numere de la 0 la lungimea semnalului(N) - 1, totul impartit la N. Masca mask va fi un vector pentru filtrarea trece-jos, cu valorile 1 -> frecvente mai mici egale decat frecventa de taiere si 0 pentru cele mai mari. Aplic operatorul hadamard intre transformata Fourier a semnalului si masca, apoi calculez inversa transformatei Fourier si semnalul filtrat il normalizez, prin impartirea la valoarea maxima in modul a semnalului filtrat.

# 5. Functia reverb:
  
  Initializez impulse_response, raspunsul impuls, cu rezultatul functiei stereo_to_mono aplicat pe acest semnal, pentru a ma asigura ca e mono. Apoi, calculez produsul de convolutie  dintre semnalul initial signal si raspunsul implus, folosind functia fftconv. In final normalizez semnalul nou obtinut, si i-l atribui semnalului returnat de functie.

## TASK 2

# 1. Functia parse_data:

  Am deschid cu fopen fisierul cu numele filename, in modul read, apoi cu fscanf, aproape ca in C, citesc n, x, y, si la final inchid fisierul.

# 2. Functia spline-c2:

  In cadrul acestei functii, am incercat sa aplic algoritmul pentru splline-ul cubic natural, ce se regaseste sub forma de pseudocod in cadrul cartii de MN(...). In h am pastrat diferentele de ordinul I, intre punctele de pe axa x, apoi mi am luat un vector alfa in care retin estimarea derivatelor de ordinul I ale functiei in punctele intermediare. l, miu si z, ii actualizez cu un for de la al doilea punct pana la penultimul pentru a determina coeficientii spline-ului cubic in fiecare punct intermediar. Initial, in vectorul l, pun primul element 1, pentru ca nu am nicio informatie despre vreo valoare anterioara.  Apoi in for aplic cele 3 formule, descrise in pseudocod. Apoi , in final, cu forul j de la n-1 la 0, calculez coeficientii a(j), b(j), c(j), d(j), tot dupa formulele specificate si in vectorul de coeficienti, concatenez acesti 4 coeficienti.

# 3. Functia p_spline:

  Am initializat n si m cu lungimea vectorului x, ce va reprezenta numarul de puncte de control(n), respectiv pe m cu lungimea vectorului x_interp, ce va reprezenta numarul de puncte in care trebuie sa interpolez valorile spline-ului. y_interp va reprezenta vectorul de rezultate, de lungime m, intial populat doar cu zerouri. Extrag cei patru coeficienti si cu ajutorul buclei for, parcurg fiecare punct din x_interp  si pentru fiecare caut in intervalul
  [x(i), x(i+1)], in care se afla x_interp(i), apoi calculez mica diferenta dx, intre punctele de interpolare si inceputul intervalului curent.
  Apoi calculez valorile spline-ului folosind formula spline-ului cubic aferenta si returnez valorile interpolate in punctele date de x_interp.

# 4. Functia vandermonde:

  In cadrul acestei fucntii, creez matricea V, de dimensiune n*n, n fiind lungimea vectorului x, iar fiecare element de pe coloana (i) a matricei V o sa fie formata din fiecare valoare din x ridicate la puterea (i-1) (pe care le atribui cu acel for, folosind si operatorul hadamard), iar in final, rezolv sistemul  V * coef = y'

# 5. Functia P_vandermonde: 

  Initializez cu zerouri, vectorul y_interp, cu dimensiunea egala cu vectorul de interpolare, x_interp.
  Cu un for, adun in vectorul y_interp, produsul dintre fiecare coeficient al polinomului (coef(i)) si fiecare element din x_interp, ridicat la puterea (i-1).

## TASK 3

# 1. Functia read_mat:

  In aceasta functie doar citesc(incarc) matricea de la calea path, cu ajutorul lui csvread, insa am grija sa omit randul si coloana din antet, pentru ca citirea sa fie corecta, citire a valorilor numerice.

# 2. Functia cosine_similarity:

  Calculez normele vectorilor vect1 si vect2, folosind functia norm, apoi calculez produsul scalar intre cei doi vectori, utilizand functia dot. In final, calculez similaritatea definita ca raportul dintre produsul scalar si produsul normelor celor doi vectori.

# 3. Functia preprocess:

  Numarul de review-uri, va fi egal cu suma(calculata pe fiecare rand, pentru ca am acel 2 specificat ca al doilea parametru din functia sum) matricei mat~=0, artificiu ce ma ajuta sa am in matrice valori 1, unde elementele din mat sunt nenule si valori de 0, pe pozitiile din mat care sunt nule. Apoi identific randurile care au cel putin min_reviews evaluari nenule si formez matricea filtrata, pentru a pastra doar randurile valide.

# 4. Functia recommendations:

  Prima data, citesc matricea mat din fisierul de la calea path si il incarc. Apoi aplic functia preprocess construita anterior pentru a preprocesa matricea incarcata, astfel incat sa se pastreze doar randurile cu cel putin min_reviews evaluari nenule!. Aplic apoi cu functia svds, specificata in cerinta, rezultatele descompunerii memorandu-le in Ur -> matricea de vectori de baza(cea stanga a vectorilor singulari), Sr -> matricea diagonala a valorilor singulare si Vr -> matricea transpusa a vectorilor dreapta.  Extrag in linked_vector, vectorul asociat temei preferate din matricea Vr si apoi calculez similaritatea (cosine similarity) dintre vectorul preferat si toate celelalte teme, iterand cu bucla for. De asemenea, sortez indecsii temelor in functie de scorurile de similaritate in ordine descrescatoare. Indicele temei preferate linked_theme il voi exclude din lista de recomandari. In final, extrag primele num_recoms teme sortate ca recomandari si le memorez in vectorul recoms.
